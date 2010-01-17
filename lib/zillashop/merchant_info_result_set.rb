class Zillashop
  class MerchantInfoResultSet
    attr_reader :merchants

    def initialize(hsh)
      @hash = hsh
      if merchant_info_set.is_a? Hash
        @merchants = [MerchantInfoResult.new(merchant_info_set)]
      else
        @merchants = merchant_info_set.map { |m| MerchantInfoResult.new(m) }
      end
    end

    def size
      @merchants.length
    end

    def xmlns
      merchant_info_response["xmlns"]
    end
    
    private

    def merchant_info_response
      @hash['MerchantResponse']
    end

    def merchant_info_set
      merchant_info_response['Merchants']['Merchant']
    end

  end
end
