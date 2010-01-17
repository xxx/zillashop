class Zillashop

  # @author mpd
  # @version 1.0
  class OfferResult
    # initalize an offer for a specific product from a specific merchant
    #
    # @param [Hash] hsh an offer result returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
    end

    # how heavy the offered product is to ship
    #
    # @return [Float] the weight
    # @todo figure out what this unit of measurement is. Shopzilla does not document this field
    def ship_weight
      @hash["shipWeight"].to_f
    end

    # the price of the offered product
    #
    # @return [String] the price
    def price
      @hash["price"]
    end

    # the url with full details on the offer
    #
    # @return [String] the url
    def detail_url
      @hash["detailUrl"]
    end

    # the shipping type of the offer
    #
    # @return [String] the type
    def ship_type
      @hash["shipType"]
    end

    # the cost to ship the product
    #
    # @return [String] the shipping cost
    def ship_amount
      @hash["shipAmount"]
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

    # the merchant id
    #
    # @return [Fixnum] the merchant id
    def merchant_id
      @hash["merchantId"].to_i
    end

    # item in stock or not
    #
    # @return [String] the stock value
    def stock
      @hash["stock"]
    end

    # boolean representation of whether the item is in stock or not
    #
    # @return [Boolean] the stock value
    def in_stock?
      stock == 'IN'
    end

    # merchant's product ID
    #
    # @return [String] the merchant's product ID
    def merchant_product_id
      @hash["merchantProductId"]
    end

    # url to the offer
    #
    # @return [String] the url to the offer
    def url
      @hash["url"]
    end

    # condition of the offered product
    #
    # @return [String] the conditon
    def condition
      @hash["condition"]
    end

    # category of the offered product
    #
    # @return [Fixnum] the category
    def category_id
      @hash["categoryId"].to_i
    end

    # id of the offered product
    #
    # @return [Fixnum] the id
    def id
      @hash["id"].to_i
    end

    # the url to the offering merchant's logo
    #
    # @return [String] the url
    def merchant_logo_url
      @hash["merchantLogoUrl"]
    end

    # the manufacturer of the offered product
    #
    # @return [String] the manufacturer
    def manufacturer
      @hash["manufacturer"]
    end

    # the manufacturer's sku (stock keeping unit) of the offered product
    #
    # @return [String] the sku
    # @todo make sure this is really being used for the manufacturer's sku
    def sku
      @hash["sku"]
    end

    # whether the offer is bidded or not
    #
    # @return [String] the bidded value
    def bidded
      @hash["bidded"]
    end

    # boolean representation of whether the offer is bidded or not
    #
    # @return [Boolean] the bidded value
    def bidded?
      bidded == 'true'
    end

    # description of the offered product
    #
    # @return [String] the description
    def description
      @hash["description"]
    end

    # the rating of the offering merchant
    #
    # @return [Float] the rating
    def merchant_rating
      @hash["MerchantRating"]["value"].to_f
    end

    # the image for the offering merchant's rating
    #
    # @return [String] the url to the image
    def merchant_rating_image
      @hash["MerchantRating"]["Image"]
    end

    # the name of the merchant
    #
    # @return [String] the name
    def merchant
      @hash["merchantName"]
    end
  end
end