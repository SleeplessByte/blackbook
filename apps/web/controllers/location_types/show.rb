require_relative 'set_location_type'

module Web::Controllers::LocationTypes
  class Show
    include Web::Action
    include SetLocationType

    def call(params)
    end
  end
end
