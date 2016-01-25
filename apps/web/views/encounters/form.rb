module Web::Views::Encounters
  module Form

    include Validations::Messages
    include FormHelper

    def actors_as_options( user_id = current_user.id )
      ActorRepository.find_for_user( user_id ).all.map do |actor|
        name = [ actor.name_first, actor.name_last ].each( &:strip ).reject( &:blank? ).join ' '
        [ actor.id, name ]
      end
    end

    def locations_as_options( user_id = current_user.id )
      LocationRepository.find_for_user( user_id ).all.map do |location|
        [ location.id, location.name ]
      end
    end

    def form
      form_for :encounter, form_path, method: form_method, class: 'ui form' do
        div( class: 'ui piled segment' ) do

          div( class: 'field' ) do
            label 'Actor *', for: :actor_id
            div( class: 'ui input' ) do
              dropdown_field 'encounter[actor_id]', value: encounter.actor_id, search: true, default: 'Select actor', collection: actors_as_options
            end
          end

          div( class: 'field' ) do
            label 'Location *', for: :location_id
            div( class: 'ui input' ) do
              dropdown_field 'encounter[location_id]', value: encounter.location_id, search: true, default: 'Select location', collection: locations_as_options
            end
          end

          div( class: 'field' ) do
            label 'Date of Interaction', for: :interaction_at
            div( class: 'ui input' ) do
              date_field :interaction_at, value: encounter.interaction_at
            end
          end

          submit encounter.id ? 'Update' : 'Create', class: 'ui large red submit button'
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
      return routes.encounter_path( encounter.id ) if encounter.id
      routes.encounters_path
    end

    def form_method
      encounter.id ? :patch : :post
    end

  end
end