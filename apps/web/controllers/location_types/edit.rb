require_relative 'set_location_type'

module Web::Controllers::LocationTypes
  class Edit
    include Web::Action
    include SetLocationType

    def call(params)
    end
  end
end
