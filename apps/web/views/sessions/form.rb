module Web::Views::Sessions
  module Form

    include Validations::Messages

    def form
      form_for :session, routes.login_path, method: :post, class: 'ui large form' do

        div( class: 'ui stacked segment' ) do

          div( class: 'field' ) do
            div( class: 'ui left icon input' ) do
              i( class: 'user icon' ) {}
              text_field :username
            end
          end

          div( class: 'field' ) do
            div( class: 'ui left icon input' ) do
              i( class: 'lock icon' ) {}
              password_field :password
            end
          end

        end

        submit 'Login', class: 'ui fluid large red submit button'

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
  end
end