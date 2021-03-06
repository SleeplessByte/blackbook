module Web
  module Views
    class ApplicationLayout
      include Web::Layout

      def each_flash
        %i(success info warning error).each do |type|
          message = @scope.locals[:flash][type]
          yield type, message if message
        end
      end
    end
  end
end
