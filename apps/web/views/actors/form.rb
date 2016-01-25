module Web::Views::Actors
  module Form

    include Validations::Messages

    def form
      form_for :actor, form_path, method: form_method, class: 'ui form' do
        #input name: 'id', value: actor.id, type: :hidden if actor.id
        div( class: 'ui piled segment' ) do

          div( class: 'field' ) do
            label 'First name*', for: :name_first
            div( class: 'ui input' ) do
              text_field :name_first, value: actor.name_first, required: true
            end
          end

          div( class: 'field' ) do
            label 'Last name', for: :name_last
            div( class: 'ui input' ) do
              text_field :name_last, value: actor.name_last
            end
          end

          div( class: 'field' ) do
            label 'Date of Birth', for: :date_of_birth
            div( class: 'ui input' ) do
              date_field :date_of_birth, value: actor.date_of_birth
            end
          end

          div( class: 'field' ) do
            label 'Phone', for: :phone
            div( class: 'ui input' ) do
              text_field :phone, value: actor.phone
            end
          end

          div( class: 'field' ) do
            label 'E-mail', for: :email
            div( class: 'ui input' ) do
              email_field :email, value: actor.email
            end
          end

          div( class: 'field' ) do
            label 'Facebook ID', for: :facebook_id
            div( class: 'ui input' ) do
              text_field :facebook_id, value: actor.facebook_id
            end
          end

          div( class: 'field' ) do
            div( class: 'ui checkbox' ) do
              check_box :foreskin_flag, tabindex: '0', class: 'hidden', checked: actor.foreskin_flag
              label 'Has foreskin', for: :foreskin_flag
            end
          end

          submit actor.id ? 'Update' : 'Create', class: 'ui large red submit button'

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
      return routes.actor_path( actor.id ) if actor.id
      routes.actors_path
    end

    def form_method
      actor.id ? :patch : :post
    end

  end
end