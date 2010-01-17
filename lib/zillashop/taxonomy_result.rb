class Zillashop
  class TaxonomyResult
    attr_reader :children
    
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

    def categories
      children
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

    def minimum_bid
      @hash["minimumBid"].to_i
    end
    
    def probability
      @hash["probability"].to_f
    end
  end
end