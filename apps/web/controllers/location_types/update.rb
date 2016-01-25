require_relative 'params'
require_relative 'set_location_type'

module Web::Controllers::LocationTypes
  class Update
    include Web::Action
    include Params
    include SetLocationType

    def call( params )
      if params.valid?
        update_params = params[ :location_type ]
        @location_type.update( update_params )
        if @location_type.valid?
          LocationTypeRepository.update( @location_type )
          redirect_to routes.location_type_path( @location_type.id )
        end
      end
    end
  end
end
