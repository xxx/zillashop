class Zillashop
  class OfferResult
    def initialize(hsh)
      @hash = hsh
    end

    def ship_weight
      @hash["shipWeight"].to_f
    end

    def price
      @hash["price"]
    end

    def detail_url
      @hash["detailUrl"]
    end

    def ship_type
      @hash["shipType"]
    end

    def ship_amount
      @hash["shipAmount"]
    end

    def images
      @hash["Images"]["Image"]
    end

    def title
      @hash['title']
    end

    def merchant_id
      @hash["merchantId"].to_i
    end

    def stock
      @hash["stock"]
    end

    def in_stock?
      stock == 'IN'
    end

    def merchant_product_id
      @hash["merchantProductId"]
    end

    def url
      @hash["url"]
    end

    def condition
      @hash["condition"]
    end

    def category_id
      @hash["categoryId"].to_i
    end

    def id
      @hash["id"].to_i
    end

    def merchant_logo_url
      @hash["merchantLogoUrl"]
    end

    def manufacturer
      @hash["manufacturer"]
    end

    def sku
      @hash["sku"]
    end

    def bidded
      @hash["bidded"]
    end

    def bidded?
      bidded == 'true'
    end

    def description
      @hash["description"]
    end

    def merchant_rating
      @hash["MerchantRating"]["value"].to_f
    end

    def merchant_rating_image
      @hash["MerchantRating"]["Image"]
    end

    def merchant
      @hash["merchantName"]
    end
  end
end