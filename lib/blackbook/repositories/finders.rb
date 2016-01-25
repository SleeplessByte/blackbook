module Blackbook
  module Repositories
    module Finders

      def self.find_by( field_and_value )
        query do
          where( field_and_value ).
              limit( 1 )
        end
      end

    end
  end
end