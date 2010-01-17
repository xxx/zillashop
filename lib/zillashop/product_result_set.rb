class Zillashop
  class ProductResultSet
    attr_reader :products, :offers

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

    def size
      @set['includedResults'].to_i
    end
    alias included_results size

    def total_results
      @set['totalResults'].to_i
    end

    def max_price
      @set["PriceSet"]["maxPrice"]
    end

    def min_price
      @set["PriceSet"]["minPrice"]
    end

    def relevancy
      product_response["Classification"]["relevancyScore"].to_i
    end

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
