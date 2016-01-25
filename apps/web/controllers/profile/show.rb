module Web::Controllers::Profile
  class Show
    include Web::Action

    expose :user

    def call(params)
      @user = current_user
    end

  end
end
