module Web::Controllers::Actors

  module Params

    def self.included( action )
      action.class_eval do
        params do
          param :id
          param :actor do
            param :name_first,    type: String
            param :name_last,     type: String
            param :date_of_birth, type: Date
            param :facebook_id
            param :phone,         format: /(?:\A\Z)|(?:\A\+?[0-9]+(?:(?:[- .][0-9]+)|\([0-9]+\))*\Z)/, size: (10..20), type: String
            param :email,         format: /(?:\A\Z)|@/, size: (5..255), type: String
            param :foreskin_flag, type: Boolean
          end
        end
        handle_exception ArgumentError => 400
      end
    end

  end

end