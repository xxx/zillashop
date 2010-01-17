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

    def description
      details? ? details["description"] : ''
    end

    def member_since
      details? ? DateTime.parse(details["memberSince"]) : ''
    end
    
    def survey_count
      details? ? details["surveyCount"].to_i : 0
    end
    
    def survey_count_life
      details? ? details["surveyCountLife"].to_i : 0
    end
    
    def contact_address
      details? ? details["Contact"]["address1"] : ''
    end
    
    def contact_city
      details? ? details["Contact"]["city"] : ''
    end

    def contact_state
      details? ? details["Contact"]["state"] : ''
    end

    def contact_postal_code
      details? ? details["Contact"]["postalCode"] : ''
    end

    def contact_country
      details? ? details["Contact"]["country"] : ''
    end

    def contact_phone
      details? ? details["Contact"]["phone"] : ''
    end

    def contact_fax
      details? ? details["Contact"]["fax"] : ''
    end

    def feature_order_phone
      details? ? details["Features"]["orderPhone"] : ''
    end
    
    def feature_order_toll_free
      details? ? details["Features"]["orderTollFree"] : ''
    end
    
    def feature_order_fax
      details? ? details["Features"]["orderFax"] : ''
    end
    
    def feature_search
      details? ? details["Features"]["search"] : ''
    end
    
    def feature_search?
      feature_search == 'true'
    end
    
    def feature_always_confidential
      details? ? details["Features"]["alwaysConfidential"] : ''
    end
    
    def feature_always_confidential?
      feature_always_confidential == 'true'
    end
    
    def feature_live_service
      details? ? details["Features"]["liveService"] : ''
    end
    
    def feature_live_service?
      feature_live_service == 'true'
    end
    
    def feature_order_tracking
      details? ? details["Features"]["orderTracking"] : ''
    end
    
    def feature_order_tracking?
      feature_order_tracking == 'true'
    end
    
    def feature_shopping_cart
      details? ? details["Features"]["shoppingCart"] : ''
    end
    
    def feature_shopping_cart?
      feature_shopping_cart == 'true'
    end
    
    def feature_secure
      details? ? details["Features"]["secure"] : ''
    end
    
    def feature_secure?
      feature_secure == 'true'
    end
    
    def feature_guaranteed
      details? ? details["Features"]["guaranteed"] : ''
    end
    
    def feature_guaranteed?
      feature_guaranteed == 'true'
    end
    
    def feature_delivery_next_day
      details? ? details["Features"]["deliveryNextDay"] : ''
    end
    
    def feature_delivery_next_day?
      feature_delivery_next_day == 'true'
    end
    
    def feature_delivery_first_class
      details? ? details["Features"]["deliveryFirstClass"] : ''
    end
    
    def feature_delivery_first_class?
      feature_delivery_first_class == 'true'
    end
    
    def feature_delivery_ground
      details? ? details["Features"]["deliveryGround"] : ''
    end
    
    def feature_delivery_ground?
      feature_delivery_ground == 'true'
    end
    
    def feature_delivery_other
      details? ? details["Features"]["deliveryOther"] : ''
    end
    
    def feature_pay_amex
      details? ? details["Features"]["payAmex"] : ''
    end
    
    def feature_pay_amex?
      feature_pay_amex == 'true'
    end
    
    def feature_pay_discover
      details? ? details["Features"]["payDiscover"] : ''
    end
    
    def feature_pay_discover?
      feature_pay_discover == 'true'
    end
    
    def feature_pay_mastercard
      details? ? details["Features"]["payMasterCard"] : ''
    end
    
    def feature_pay_mastercard?
      feature_pay_mastercard == 'true'
    end
    
    def feature_pay_visa
      details? ? details["Features"]["payVisa"] : ''
    end
    
    def feature_pay_visa?
      feature_pay_visa == 'true'
    end
    
    private

    def details
      @hash["Details"]
    end

    def details?
      !!details
    end
  end
end