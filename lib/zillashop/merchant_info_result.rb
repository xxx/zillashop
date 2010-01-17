class Zillashop
  
  # @author mpd
  # @version 1.0
  class MerchantInfoResult
    
    # create a new MerchantInfoResult instance
    #
    # @param [Hash] hsh a merchant info result returned from ShopZilla
    def initialize(hsh)
      @hash = hsh
    end

    # the name of the merchant
    #
    # @return [String] the name of the merchant
    def name
      @hash["name"]
    end

    # the Shopzilla profile url for the merchant
    #
    # @return [String] the url
    def url
      @hash["url"]
    end

    # the Shopzilla merchant ID of the merchant
    #
    # @return [Fixnum] the ID
    def id
      @hash["id"].to_i
    end
    
    # the Shopzilla 'certified' value for the merchant
    #
    # @return [String] the raw value
    def certified
      @hash["Certification"]["certified"]
    end
    
    # boolean predicate representation of Shopzilla 'certified' value
    #
    # @return [Boolean] the boolean representation
    def certified?
      certified == 'true'
    end
    
    # the url to the Shopzilla certification image for the merchant
    #
    # @return [String] the url to the image
    def certification_image
      @hash["Certification"]["Image"]
    end
    
    # the url to the logo of the merchant
    #
    # @return [String] the url
    def logo_url
      @hash["logoUrl"]
    end
    
    # customer rating on whether items from the merchant met expectation
    #
    # @return [Float] the rating
    def rating_item_met_expectation
      @hash["Rating"]["ItemMetExpect"]["value"].to_f
    end
    
    # image for customer rating on whether items from the merchant met expectation
    #
    # @return [String] the url to the image
    def rating_item_met_expectation_image
      @hash["Rating"]["ItemMetExpect"]["Image"]
    end
    
    # customer rating on whether customers would shop with the merchant again
    #
    # @return [Float] the rating
    def rating_shop_again
      @hash["Rating"]["ShopAgain"]["value"].to_f
    end
    
    # image for customer rating on whether customers would shop with the merchant again
    #
    # @return [String] the url to the image
    def rating_shop_again_image
      @hash["Rating"]["ShopAgain"]["Image"]
    end
    
    # customer rating for the merchant overall
    #
    # @return [Float] the rating
    def rating_overall
      @hash["Rating"]["Overall"]["value"].to_f
    end
    
    # image for customer rating for the merchant overall
    #
    # @return [String] the url to the image
    def rating_overall_image
      @hash["Rating"]["Overall"]["Image"]
    end
    
    # customer rating on whether the merchant delivers items on time
    #
    # @return [Float] the rating
    def rating_on_time_delivery
      @hash["Rating"]["OnTimeDeliv"]["value"].to_f
    end
    
    # image for customer rating on whether the merchant delivers items on time
    #
    # @return [String] the url to the image
    def rating_on_time_delivery_image
      @hash["Rating"]["OnTimeDeliv"]["Image"]
    end
    
    # customer rating for the merchant's customer support
    #
    # @return [Float] the rating
    def rating_customer_support
      @hash["Rating"]["CustSupport"]["value"].to_f
    end
    
    # image for customer rating for the merchant's customer support
    #
    # @return [String] the url to the image
    def rating_customer_support_image
      @hash["Rating"]["CustSupport"]["Image"]
    end

    # the description of the merchant.
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the description of the merchant
    def description
      details? ? details["description"] : ''
    end

    # when the merchant joined Shopzilla/Bizrate
    # only useful when :expand_details => true is passed to the query
    #
    # @return [DateTime, String] when the merchant joined Shopzilla/Bizrate
    def member_since
      details? ? DateTime.parse(details["memberSince"]) : ''
    end
    
    # how many surveys the merchant's current rating info is based on
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Fixnum] the number of surveys
    def survey_count
      details? ? details["surveyCount"].to_i : 0
    end
    
    # how many surveys the merchant has ever received
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Fixnum] the number of surveys
    def survey_count_life
      details? ? details["surveyCountLife"].to_i : 0
    end
    
    # contact address for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the address
    def contact_address
      details? ? details["Contact"]["address1"] : ''
    end
    
    # contact city for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the city
    def contact_city
      details? ? details["Contact"]["city"] : ''
    end

    # contact state for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the state
    def contact_state
      details? ? details["Contact"]["state"] : ''
    end

    # contact postal code for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the postal code
    def contact_postal_code
      details? ? details["Contact"]["postalCode"] : ''
    end

    # contact country for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the country
    def contact_country
      details? ? details["Contact"]["country"] : ''
    end

    # contact phone number for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the phone number
    def contact_phone
      details? ? details["Contact"]["phone"] : ''
    end

    # contact fax number for the merchant
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the fax number
    def contact_fax
      details? ? details["Contact"]["fax"] : ''
    end

    # the merchant's phone number for orders
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the phone number
    def feature_order_phone
      details? ? details["Features"]["orderPhone"] : ''
    end
    
    # the merchant's toll-free phone number for orders
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the phone number
    def feature_order_toll_free
      details? ? details["Features"]["orderTollFree"] : ''
    end

    # the merchant's fax number for orders
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the fax number
    def feature_order_fax
      details? ? details["Features"]["orderFax"] : ''
    end

    # merchant's website search availability
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the availability
    def feature_search
      details? ? details["Features"]["search"] : ''
    end
    
    # boolean representation of merchant's website search availability
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the availability
    def feature_search?
      feature_search == 'true'
    end

    # whether merchant keeps customer info confidential at all levels
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the confidentiality value
    def feature_always_confidential
      details? ? details["Features"]["alwaysConfidential"] : ''
    end

    # boolean representation of whether merchant keeps customer info confidential at all levels
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the confidentiality value
    def feature_always_confidential?
      feature_always_confidential == 'true'
    end

    # whether the merchant offers live customer service
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the live service value
    def feature_live_service
      details? ? details["Features"]["liveService"] : ''
    end

    # boolean representation of whether the merchant offers live customer service
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the live service value
    def feature_live_service?
      feature_live_service == 'true'
    end

    # whether the merchant offers order tracking
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the order tracking value
    def feature_order_tracking
      details? ? details["Features"]["orderTracking"] : ''
    end

    # boolean representation of whether the merchant offers order tracking
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the order tracking value
    def feature_order_tracking?
      feature_order_tracking == 'true'
    end

    # whether the merchant has an online shopping cart system
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the shopping cart value
    def feature_shopping_cart
      details? ? details["Features"]["shoppingCart"] : ''
    end

    # boolean representation of whether the merchant has an online shopping cart system
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the shopping cart value
    def feature_shopping_cart?
      feature_shopping_cart == 'true'
    end

    # whether the merchant offers secure checkout
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the secure value
    def feature_secure
      details? ? details["Features"]["secure"] : ''
    end

    # boolean representation of whether the merchant offers secure checkout
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the secure value
    def feature_secure?
      feature_secure == 'true'
    end

    # whether the merchant offers a 100% money-back guarantee
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the guaranteed value
    def feature_guaranteed
      details? ? details["Features"]["guaranteed"] : ''
    end

    # boolean representation of whether the merchant offers a 100% money-back guarantee
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the guaranteed value
    def feature_guaranteed?
      feature_guaranteed == 'true'
    end

    # whether the merchant offers next-day delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the delivery next day value
    def feature_delivery_next_day
      details? ? details["Features"]["deliveryNextDay"] : ''
    end

    # boolean representation of whether the merchant offers next-day delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the delivery next day value
    def feature_delivery_next_day?
      feature_delivery_next_day == 'true'
    end

    # whether the merchant offers first-class delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the delivery first class value
    def feature_delivery_first_class
      details? ? details["Features"]["deliveryFirstClass"] : ''
    end

    # boolean representation of whether the merchant offers first-class delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the delivery first class value
    def feature_delivery_first_class?
      feature_delivery_first_class == 'true'
    end

    # whether the merchant offers ground delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the delivery ground value
    def feature_delivery_ground
      details? ? details["Features"]["deliveryGround"] : ''
    end

    # boolean representation of whether the merchant offers ground delivery
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the delivery ground value
    def feature_delivery_ground?
      feature_delivery_ground == 'true'
    end

    # other types of delivery the merchant offers
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] a concatenation of other offered delivery types
    def feature_delivery_other
      details? ? details["Features"]["deliveryOther"] : ''
    end

    # whether the merchant accepts American Express
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the pay amex value
    def feature_pay_amex
      details? ? details["Features"]["payAmex"] : ''
    end

    # boolean representation of whether the merchant accepts American Express
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the pay amex value
    def feature_pay_amex?
      feature_pay_amex == 'true'
    end

    # whether the merchant accepts Discover
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the pay discover value
    def feature_pay_discover
      details? ? details["Features"]["payDiscover"] : ''
    end

    # boolean representation of whether the merchant accepts Discover
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the pay discover value
    def feature_pay_discover?
      feature_pay_discover == 'true'
    end

    # whether the merchant accepts MasterCard
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the pay mastercard value
    def feature_pay_mastercard
      details? ? details["Features"]["payMasterCard"] : ''
    end

    # boolean representation of whether the merchant accepts MasterCard
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the pay mastercard balue
    def feature_pay_mastercard?
      feature_pay_mastercard == 'true'
    end

    # whether the merchant accepts Visa
    # only useful when :expand_details => true is passed to the query
    #
    # @return [String] the pay visa value
    def feature_pay_visa
      details? ? details["Features"]["payVisa"] : ''
    end

    # boolean representation of whether the merchant accepts Visa
    # only useful when :expand_details => true is passed to the query
    #
    # @return [Boolean] the pay visa value
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