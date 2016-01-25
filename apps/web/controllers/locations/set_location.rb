module Web::Controllers::Locations
  module SetLocation
    def self.included( action )
      action.class_eval do
        before :set_location
        expose :location
        handle_exception RecordNotFound => 404
        handle_exception Forbidden => 403
      end
    end

    private

    def set_location( params )
      @location = LocationRepository.find( params[:id] ) or raise RecordNotFound.new(
          "Looking for location with id = #{params[:id]}" )
    end
  end
end