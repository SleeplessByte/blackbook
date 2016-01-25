module Web::Views::Interactions
  class Index
    include Web::View

    def interactions_each
      interactions.each do |interaction|
        yield interaction
      end
    end

    def interactions_as_cards_each
      interactions_each do |card|
        yield Cards::Interaction.new( card )
      end
    end

    def interaction_count
      "#{format_number interaction.size } interactions"
    end

    def interaction_name( interaction )
      interaction.name
    end

    def interaction_symbol( interaction )
      interaction.symbol
    end

    def interaction_risk_factor( interaction )
      interaction.risk_factor
    end

    def interaction_path( interaction )
      routes.interaction_path( interaction.id )
    end

    def edit_interaction_path( interaction )
      routes.edit_interaction_path( interaction.id )
    end
  end
end
