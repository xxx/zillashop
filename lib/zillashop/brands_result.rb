class Zillashop
  
  # @author mpd
  # @version 1.0
  class BrandsResult
    attr_accessor :model

    # create a new BrandsResult instance
    #
    # @param [Hash] hsh a brand result returned from ShopZilla
    def initialize(hsh)
      @hash = hsh
    end

    # the name of this brand
    #
    # @return [String] the brand name
    def name
      @hash["name"]
    end

    # the number of products with this brand
    #
    # @return [Fixnum] the product count
    def product_count
      @hash["productCount"].to_i
    end

    # url link to Shopzilla
    #
    # @return [String] the url
    def url
      @hash["url"]
    end

    # Shopzilla's brand ID
    #
    # @return [Fixnum] the brand ID within Shopzilla
    def id
      @hash["id"].to_i
    end
  end
end
