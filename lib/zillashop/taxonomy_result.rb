class Zillashop

  # @author mpd
  # @version 1.0
  class TaxonomyResult
    attr_reader :children
    attr_accessor :model_id
    
    # create a new TaxonomyResult instance
    #
    # @param [Hash] hsh a taxonomy result returned from ShopZilla
    def initialize(hsh)
      @hash = hsh["Category"].is_a?(Hash) ? hsh["Category"] : hsh
      if !@hash["Children"]
        @children = []
      else
        kids = @hash["Children"]
        if !kids["Category"]
          @children = []
        elsif kids["Category"].is_a?(Hash)
          @children = [TaxonomyResult.new(kids["Category"])]
        else
          @children = kids["Category"].map { |p| TaxonomyResult.new(p) }
        end
      end
    end

    # alias method for children
    #
    # @return [Array] the (sub) categories
    def categories
      children
    end

    # the name of this category
    #
    # @return [String] the name
    def name
      @hash["name"]
    end

    # the url to BizRate for this category
    #
    # @return [String] the url
    def url
      @hash["url"]
    end

    # the category ID
    #
    # @return [Fixnum] the category ID
    def id
      @hash["id"].to_i
    end

    # minimum bid (CPC) for this category
    #
    # @return [Fixnum] the minimum bid in cents
    def minimum_bid
      @hash["minimumBid"].to_i
    end

    # the probability
    #
    # @return [Float] the probability that this result matched the query
    def probability
      @hash["probability"].to_f
    end
  end
end