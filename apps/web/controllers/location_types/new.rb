module Web::Controllers::LocationTypes
  class New
    include Web::Action

    expose :location_type

    def call( params )
      @location_type = LocationType.new
    end
  end
end
