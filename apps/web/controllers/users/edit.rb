require_relative 'set_user'

module Web::Controllers::Users
  class Edit
    include Web::Action
    include SetUser

    def call(params)
    end
  end
end
