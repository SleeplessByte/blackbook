module Web::Controllers::LocationTypes
  module SetLocationType
    def self.included( action )
      action.class_eval do
        before :set_location_type
        expose :location_type
        handle_exception RecordNotFound => 404
        handle_exception Forbidden => 403
      end
    end

    private

    def set_location_type( params )
      @location_type = LocationTypeRepository.find( params[:id] ) or raise RecordNotFound.new(
          "Looking for location type with id = #{params[:id]}" )
    end
  end
end