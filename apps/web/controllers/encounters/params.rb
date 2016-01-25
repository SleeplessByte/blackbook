module Web::Controllers::Encounters

  module Params

    def self.included( action )
      action.class_eval do
        params do
          param :id
          param :encounter do
            param :actor_id,        type: Integer,   presence: true
            param :location_id,     type: Integer,   presence: true
            param :interaction_at,  type: DateTime
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

end