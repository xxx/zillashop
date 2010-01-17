class Zillashop

  # @author mpd
  # @version 1.0
  class ProductResultSet
    attr_reader :products, :offers

    # create a new result set for a product query
    #
    # @param [Hash] hsh the product results returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
      @set = product_set || offer_set

      if !@set["Product"]
        @products = []
      elsif @set["Product"].is_a? Hash
        @products = [ProductResult.new(@set["Product"])]
      else
        @products = @set["Product"].map { |p| ProductResult.new(p) }
      end

      if !@set["Offer"]
        @offers = []
      elsif @set["Offer"].is_a? Hash
        @offers = [OfferResult.new(@set["Offer"])]
      else
        @offers = @set["Offer"].map { |p| OfferResult.new(p) }
      end
    end

    # the sum of products and offers included in the result set
    #
    # @return [Fixnum] the sum of products and offers
    def size
      @set['includedResults'].to_i
    end
    alias included_results size

    # the total sum of products and offers found
    #
    # @return [Fixnum] the total sum
    def total_results
      @set['totalResults'].to_i
    end

    # the maximum price of the items in the result set
    #
    # @return [String] the maximum price
    def max_price
      @set["PriceSet"]["maxPrice"]
    end

    # the minimum price of the items in the result set
    #
    # @return [String] the minimum price
    def min_price
      @set["PriceSet"]["minPrice"]
    end

    # the relevancy score of the result set
    #
    # @return [Fixnum] the relevancy score
    def relevancy
      product_response["Classification"]["relevancyScore"].to_i
    end

    # the XML namespace of the raw result set
    #
    # @return [String] the XML namespace
    def xmlns
      product_response["xmlns"]
    end
    
    private

    def product_response
      @hash['ProductResponse']
    end

    def product_set
      product_response['Products']
    end

    def offer_set
      product_response['Offers']
    end
  end
end
