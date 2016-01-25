module Web::Controllers::Home
  class Index
    include Web::Action

    def call(params)
    end

    private
    def authenticate
      #no-op
    end
  end
end
