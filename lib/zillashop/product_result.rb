class Zillashop

  # @author mpd
  # @version 1.0
  class ProductResult
    attr_accessor :model_id

    # initialize a product that is offered by one or more merchants
    #
    # @param [Hash] hsh a product result returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
    end

    # product images
    #
    # @return [Array] urls for a number of different-sized images of the product
    def images
      @hash["Images"]["Image"]
    end

    # product title
    #
    # @return [String] the title
    def title
      @hash['title']
    end

    # maximum price of offers
    #
    # @return [String] the maximum price
    def max_price
      @hash["PriceSet"]["maxPrice"]
    end

    # minimum price of offers
    #
    # @return [String] the minimum price
    def min_price
      @hash["PriceSet"]["minPrice"]
    end

    # the number of merchants making an offer for this product
    #
    # @return [Fixnum] the number of merchants
    def stores
      @hash["PriceSet"]["stores"].to_i
    end

    # the relevancy of this result to the search criteria
    #
    # @return [String] the relevancy score
    def relevancy
      @hash["relevancy"]
    end

    # the url to the BizRate offers page for this product
    #
    # @return [String] the url to the page
    def url
      @hash["url"]
    end

    # the category id of the product
    #
    # @return [Fixnum] the category id
    def category_id
      @hash["categoryId"].to_i
    end

    # the product id
    #
    # @return [Fixnum] the product's id
    def id
      @hash["id"].to_i
    end

    # the manufacturer of the product
    #
    # @return [String] the manufacturer's name
    def manufacturer
      @hash["manufacturer"]
    end

    # the description of the product
    #
    # @return [String] the description
    def description
      @hash["Description"]
    end
  end
end