module Web::Views::Users
  module Form
    def form
      form_for :user, ( user.id ? routes.user_path( user ) : routes.users_path ),
               method: ( user.id ? :put : :post ) do

        text_field( :username, required: true ) unless user.id
        text_field :email, required: true
        password_field :old_password, required: true if user.id
        password_field :password, required: true
        password_field :password_confirmation, required: true

        submit( user.id ? 'Update' : 'Create' )
      end
    end
  end
end