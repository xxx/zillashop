class Zillashop
  class ProductResult
    def initialize(hsh)
      @hash = hsh
    end

    def images
      @hash["Images"]["Image"]
    end

    def title
      @hash['title']
    end

    def max_price
      @hash["PriceSet"]["maxPrice"]
    end

    def min_price
      @hash["PriceSet"]["minPrice"]
    end

    def stores
      @hash["PriceSet"]["stores"].to_i
    end

    def relevancy
      @hash["relevancy"]
    end

    def url
      @hash["url"]
    end

    def category_id
      @hash["categoryId"].to_i
    end

    def id
      @hash["id"].to_i
    end

    def manufacturer
      @hash["manufacturer"]
    end

    def description
      @hash["Description"]
    end
  end
end