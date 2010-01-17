class Zillashop
  class TaxonomyResultSet
    attr_reader :children

    def initialize(hsh)
      @hash = hsh
      if taxonomy_set.is_a? Hash
        @children = [TaxonomyResult.new(taxonomy_set)]
      else
        @children = taxonomy_set.map { |p| TaxonomyResult.new(p) }
      end
    end

    def categories
      children
    end

    def size
      @children.length
    end

    def xmlns
      taxonomy_response["xmlns"]
    end
    
    private

    def taxonomy_response
      @hash['TaxonomyResponse']
    end

    def taxonomy_set
      taxonomy_response['Taxonomy']["Categories"]
    end

  end
end
