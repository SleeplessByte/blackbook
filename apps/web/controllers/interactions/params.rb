module Web::Controllers::Interactions

  module Params

    def self.included( action )
      action.class_eval do
        params do
          param :id
          param :interaction do
            param :name,          type: String,   presence: true
            param :symbol,        type: String
            param :risk_factor,   type: Integer
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

end