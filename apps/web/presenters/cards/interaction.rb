require_relative 'card'

module Cards
  class Interaction < Card

    attr_reader :ribbon, :ribbon_color

    def initialize( interaction, ribbon: nil, ribbon_color: '' )
      self.interaction = interaction
      self.ribbon = ribbon || interaction.symbol
      self.ribbon_color = ribbon_color
    end

    def link
      routes.interaction_path( interaction.id )
    end

    def has_header?
      true
    end

    def header
      interaction.name
    end

    def has_ribbon?
      ribbon && !ribbon.blank?
    end

    def has_description?
      true
    end

    def description
      builder = html

      builder.div( class: 'ui two tiny statistics' ) do
        div( class: 'statistic' ) do
          div( class: 'value' ) do
            encounters_count
          end
          div( class: 'label' ) do
            'Encounters'
          end
        end

        div( class: 'statistic' ) do
          div( class: 'value' ) do
            raw interaction.symbol || '(none)'
          end
          div( class: 'label' ) do
            'Symbol'
          end
        end
      end
    end

    protected
    attr_writer :ribbon, :ribbon_color
    attr_accessor :interaction

    def encounters_count
      "#{ format_number encounters.length }"
    end

    def encounters
      @encounters ||= associations.encounters
    end

    def associations
      @associations ||= InteractionAssociations.new( interaction )
    end

  end
end