require_relative 'params'

module Web::Controllers::Locations
  class Create
    include Web::Action
    include Params

    expose :location

    def call( params )
      @location = Location.new( params[ :location ] )

      if params.valid?
        @location = LocationRepository.create( @location )
        redirect_to routes.location_path( @location.id ) #if @actor.valid?
      end
    end
  end
end
