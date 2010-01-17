class Zillashop
  class BrandsResult
    def initialize(hsh)
      @hash = hsh
    end

    def name
      @hash["name"]
    end

    def product_count
      @hash["productCount"].to_i
    end

    def url
      @hash["url"]
    end

    def id
      @hash["id"].to_i
    end
  end
end