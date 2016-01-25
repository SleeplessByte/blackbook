module Web::Controllers::Locations

  module Params

    def self.included( action )
      action.class_eval do
        params do
          param :id
          param :location do
            param :name,          type: String
            param :street,        type: String
            param :postal,        type: String
            param :city,          type: String
            param :state,         type: String
            param :country,       type: String
            param :facebook_id
            param :location_type_id, type: Integer
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

end