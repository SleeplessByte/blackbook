require_relative 'params'

module Web::Controllers::Users
  class Create
    include Web::Action
    include ParamsForCreate

    expose :user

    def call( params )
      sign_up = SignUp.new( params[ :user ] )
      @user = sign_up.create
      if params.valid? && sign_up.valid? && @user.valid?
        @user = UserRepository.create( @user )
        redirect_to routes.user_path( @user.id ) if @user.valid?
      end
    end
  end
end
