require_relative 'set_location'

module Web::Controllers::Locations
  class Show
    include Web::Action
    include SetLocation

    def call(params)
    end
  end
end
