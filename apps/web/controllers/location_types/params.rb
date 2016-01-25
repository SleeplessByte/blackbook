module Web::Controllers::LocationTypes

  module Params

    def self.included( action )
      action.class_eval do
        params do
          param :id
          param :location do
            param :name,          type: String
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

end