require_relative 'params'

module Web::Controllers::LocationTypes
  class Create
    include Web::Action
    include Params

    expose :location_type

    def call( params )
      @location_type = LocationType.new( params[ :location_type ] )

      if params.valid?
        @location_type = LocationTypeRepository.create( @location_type )
        redirect_to routes.location_type_path( @location_type.id ) #if @actor.valid?
      end
    end
  end
end
