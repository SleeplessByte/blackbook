require_relative 'set_user'

module Web::Controllers::Users
  class Destroy
    include Web::Action
    include SetUser

    def call(params)
    end
  end
end
