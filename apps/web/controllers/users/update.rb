require_relative 'set_user'
require_relative 'params'

module Web::Controllers::Users
  class Update
    include Web::Action
    include SetUser
    include ParamsForUpdate

    def call(params)
      if params.valid? && @user.authenticate?( params[ :user ][ :old_password ] )
        update_params = SignUp.new( params[ :user ] ).create.attributes
        if @user.update( update_params )
          redirect_to routes.user_path( @user.id )
        end
      end
    end
  end
end
