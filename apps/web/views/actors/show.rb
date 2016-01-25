module Web::Views::Actors
  class Show
    include Web::View
    include TimeDistanceHelper

    def actor_id
      actor.id
    end

    def card
      @card ||= Cards::Actor.new( actor )
    end

    def name
      [ actor.name_first, actor.name_last ]
          .each( &:strip )
          .reject( &:blank? )
          .join( ' ' ) || '-'
    end

    def encounters_count
      "#{format_number encounters.size } encounters"
    end

    def locations_count
      "#{format_number associations.locations.size } locations"
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
      end.each( &:to_s ).join( ' ' )
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
      @associations ||= ActorAssociations.new actor
    end
  end

end
