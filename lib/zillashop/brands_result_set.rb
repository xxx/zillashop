class Zillashop
  class BrandsResultSet
    attr_reader :brands

    def initialize(hsh)
      @hash = hsh
      if brands_set["Brand"].is_a? Hash
        @brands = [BrandsResult.new(brands_set["Brand"])]
      else
        @brands = brands_set["Brand"].map { |p| BrandsResult.new(p) }
      end
      
    end

    def size
      @brands.length
    end

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
