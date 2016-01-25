module Validations
  module Messages

    # @param [Hanami::Validations::Error] error
    # @return [String] the message
    def display_error( error )
      attribute = error.attribute_name
      expected = error.expected

      message = case error.validation
        when :presence
          "#{ attribute } must be present"
        when :acceptance
          "#{ attribute } must be accepted"
        when :format
          "#{ attribute } must match #{ expected }"
        when :inclusion
          "#{ attribute } must be one of #{ expected.join( ', ' ) }"
        when :exclusion
          "#{ attribute } can't be one of #{ expected.join( ', ' ) }"
        when :size
          "#{ attribute } must be between #{ expected.begin } and #{ expected.end + ( expected.exclude_end? ? 0 : 1 ) }"
        when :confirmation
          "#{ attribute } confirmation doesn't match #{ expected }"
        else
          "#{ attribute } is not valid"
      end
      message

      if block_given?
        yield message
      else
        message
      end
    end

  end
end