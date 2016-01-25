require_relative 'set_actor'

module Web::Controllers::Actors
  class Edit
    include Web::Action
    include SetActor

    def call(params)
    end
  end
end
