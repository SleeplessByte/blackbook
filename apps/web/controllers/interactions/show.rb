require_relative 'set_interaction'

module Web::Controllers::Interactions
  class Show
    include Web::Action
    include SetInteraction

    def call(params)
    end
  end
end
