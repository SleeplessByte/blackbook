require_relative 'params'
require_relative 'set_location'

module Web::Controllers::Locations
  class Update
    include Web::Action
    include Params
    include SetLocation

    def call( params )
      if params.valid?
        update_params = params[ :location ]
        @location.update( update_params )
        if @location.valid?
          LocationRepository.update( @location )
          redirect_to routes.location_path( @location.id )
        end
      end
    end
  end
end
