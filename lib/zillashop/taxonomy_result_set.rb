class Zillashop

  # @author mpd
  # @version 1.0
  class TaxonomyResultSet
    attr_reader :children

    # create a new result set for a taxonomy query
    #
    # @param [Hash] hsh the taxonomy results returned from Shopzilla
    def initialize(hsh)
      @hash = hsh
      if taxonomy_set.is_a? Hash
        @children = [TaxonomyResult.new(taxonomy_set)]
      else
        @children = taxonomy_set.map { |p| TaxonomyResult.new(p) }
      end
    end

    # alias method for children
    #
    # @return [Array] the (sub) categories
    def categories
      children
    end

    # the XML namespace of the raw result set
    #
    # @return [String] the XML namespace
    def xmlns
      taxonomy_response["xmlns"]
    end
    
    private

    def taxonomy_response
      @hash['TaxonomyResponse']
    end

    def taxonomy_set
      taxonomy_response['Taxonomy']["Categories"]["Category"]
    end

  end
end
