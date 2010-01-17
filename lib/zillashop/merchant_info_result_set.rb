class Zillashop

  # @author mpd
  # @version 1.0
  class MerchantInfoResultSet
    attr_reader :merchants

    # create a new result set for a merchant info query
    #
    # @param [Hash] hsh the merchant info results returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
      if merchant_info_set.is_a? Hash
        @merchants = [MerchantInfoResult.new(merchant_info_set)]
      else
        @merchants = merchant_info_set.map { |m| MerchantInfoResult.new(m) }
      end
    end

    # the number of merchants found
    #
    # @return [Fixnum] the number of merchants found
    def size
      @merchants.length
    end

    # the XML namespace of the raw result set
    #
    # @return [String] the XML namespace
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
