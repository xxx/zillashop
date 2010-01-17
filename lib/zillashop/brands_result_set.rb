class Zillashop

  # @author mpd
  # @version 1.0
  class BrandsResultSet
    attr_reader :brands

    # create a new result set for a brands query
    #
    # @param [Hash] hsh the brand results returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
      if brands_set["Brand"].is_a? Hash
        @brands = [BrandsResult.new(brands_set["Brand"])]
      else
        @brands = brands_set["Brand"].map { |p| BrandsResult.new(p) }
      end
    end

    # the number of brands found
    #
    # @return [Fixnum] the number of brands found
    def size
      @brands.length
    end

    # the XML namespace of the raw result set
    #
    # @return [String] the XML namespace
    def xmlns
      brands_response["xmlns"]
    end
    
    private

    def brands_response
      @hash['BrandsResponse']
    end

    def brands_set
      brands_response['Brands']
    end

  end
end
