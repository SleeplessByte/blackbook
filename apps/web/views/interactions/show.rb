module Web::Views::Interactions
  class Show
    include Web::View

    def interaction_id
      interaction.id
    end

    def card
      @card ||= Cards::Interaction.new( interaction )
    end

    def name
      interaction.name
    end

    def encounters_count
      "#{format_number encounters.size } encounters"
    end

    def encounters_each
      encounters.each do |encounter|
        yield encounter
      end
    end

    def when_was( encounter )
      time_ago_in_words( encounter.interaction_at )
    end

    def where_was( encounter )
      EncounterAssociations.new( encounter ).location.name
    end

    def what_was( encounter )
      EncounterAssociations.new( encounter ).interactions.map do |interaction|
        html.div( class: 'ui label' ) do
          span interaction.symbol
          span interaction.risk_factor, class: 'detail'
        end
      end
    end

    def when_was_first_encounter
      encounter = encounters.first or return 'never'
      when_was( encounter )
    end

    def where_was_first_encounter
      encounter = encounters.first or return 'nowhere'
      where_was( encounter )
    end

    private
    def encounters
      associations.encounters
    end

    def associations
      @associations ||= InteractionAssociations.new interaction
    end
  end

end
