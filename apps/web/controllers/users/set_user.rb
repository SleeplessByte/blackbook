module Web::Controllers::Users
  module SetUser
    def self.included( action )
      action.class_eval do
        before :set_user
        expose :user
        handle_exception RecordNotFound => 404
      end
    end

    private

    def set_user
      @user = UserRepository.find( params[:id] ) or raise RecordNotFound.new
    end
  end
end