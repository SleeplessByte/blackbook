module Web::Controllers::LocationTypes
  class Index
    include Web::Action

    expose :location_types

    def call(params)
      @location_types = LocationTypeRepository.all
    end
  end
end
