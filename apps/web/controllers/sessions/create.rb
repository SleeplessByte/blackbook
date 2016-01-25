module Web::Controllers::Sessions
  class Create
    include Web::Action

    params do
      param :session do
        param :username, presence: true, format: /\A[A-z0-9_-]{4,64}\Z/
        param :password, presence: true, size: (9...64)
      end
    end

    def call(params)

      if params.valid?
        @user = UserRepository.find_by_username( params[ :session ][ :username ] )
        if @user && @user.authenticate?( params[ :session ][ :password ] )
          session[ :user_id ] = @user.id
          redirect_to routes.profile_path and return
        end
      end

      flash[ :error ] = 'Username or password incorrect'
      @user = nil
    end

    private
    def authenticate!
      # no-op
    end
  end
end
