module Web::Views::Interactions
  module Form

    include Validations::Messages

    def form
      form_for :interaction, form_path, method: form_method, class: 'ui form' do
        #input name: 'id', value: actor.id, type: :hidden if actor.id
        div( class: 'ui piled segment' ) do

          div( class: 'field' ) do
            label 'Name*', for: :name
            div( class: 'ui input' ) do
              text_field :name, value: interaction.name, required: true
            end
          end

          div( class: 'field' ) do
            label 'Symbol', for: :symbol
            div( class: 'ui input' ) do
              text_field :symbol, value: interaction.symbol
            end
          end

          div( class: 'field' ) do
            label 'Risk factor', for: :risk_factor
            div( class: 'ui input' ) do
              number_field :risk_factor, value: interaction.risk_factor, min: 0, max: 100, step: 0.1
            end
          end

          submit interaction.id ? 'Update' : 'Create', class: 'ui large red submit button'

        end

        unless params.valid?
          div( class: 'ui error message visible', style: 'text-align: left;' ) do
            div( class: 'header' ) do
              'Your request could not be processed'
            end
            ul( style: 'padding-left: 20px;' ) do
              params.errors.each do |error|
                display_error error do |message|
                  li message
                end
              end
            end
          end
        end

        %i(success info warning error).each do |type|
          message = flash[ type ]
          if message
            div( class: "flash #{type} ui message visible" ) do
              message
            end
          end
        end

      end
    end

    private
    def form_path
      return routes.interaction_path( interaction.id ) if interaction.id
      routes.interactions_path
    end

    def form_method
      interaction.id ? :patch : :post
    end

  end
end