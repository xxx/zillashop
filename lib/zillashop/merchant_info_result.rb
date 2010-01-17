class Zillashop
  class MerchantInfoResult
    def initialize(hsh)
      @hash = hsh
    end

    def name
      @hash["name"]
    end

    def url
      @hash["url"]
    end

    def id
      @hash["id"].to_i
    end
    
    def certified
      @hash["Certification"]["certified"]
    end
    
    def certified?
      certified == 'true'
    end
    
    def certification_image
      @hash["Certification"]["Image"]
    end
    
    def logo_url
      @hash["logoUrl"]
    end
    
    def rating_item_met_expectation
      @hash["Rating"]["ItemMetExpect"]["value"].to_f
    end
    
    def rating_item_met_expectation_image
      @hash["Rating"]["ItemMetExpect"]["Image"]
    end
    
    def rating_shop_again
      @hash["Rating"]["ShopAgain"]["value"].to_f
    end
    
    def rating_shop_again_image
      @hash["Rating"]["ShopAgain"]["Image"]
    end
    
    def rating_overall
      @hash["Rating"]["Overall"]["value"].to_f
    end
    
    def rating_overall_image
      @hash["Rating"]["Overall"]["Image"]
    end
    
    def rating_on_time_delivery
      @hash["Rating"]["OnTimeDeliv"]["value"].to_f
    end
    
    def rating_on_time_delivery_image
      @hash["Rating"]["OnTimeDeliv"]["Image"]
    end
    
    def rating_customer_support
      @hash["Rating"]["CustSupport"]["value"].to_f
    end
    
    def rating_customer_support_image
      @hash["Rating"]["CustSupport"]["Image"]
    end
  end
end