module Web::Controllers::Sessions
  class Destroy
    include Web::Action

    def call(params)
      session[ :user_id ] = nil
      redirect_to routes.root_path
    end

    private
    def authenticate!
      # no-op
    end
  end
end
