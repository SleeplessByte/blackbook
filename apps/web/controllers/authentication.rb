module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        before :authenticate!
        expose :current_user
      end
    end

    private
    def authenticate!
      unless authenticated?
        redirect_to routes.login_path
      end
    end

    def authenticated?
      !!current_user
    end

    def current_user
      @current_user ||= UserRepository.find(session[:user_id])
    end

    def current_user=( user )
      @current_user = user
    end
  end
end