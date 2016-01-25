module Web::Controllers::Users
  class New
    include Web::Action

    expose :user, :session

    def call( params )
      @user = User.new
    end
  end
end
