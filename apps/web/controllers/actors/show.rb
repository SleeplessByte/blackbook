require_relative 'set_actor'

module Web::Controllers::Actors
  class Show
    include Web::Action
    include SetActor

    def call(params)
    end
  end
end
