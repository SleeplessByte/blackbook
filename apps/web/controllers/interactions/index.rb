module Web::Controllers::Interactions
  class Index
    include Web::Action

    expose :interactions

    def call(params)
      @interactions            = InteractionRepository.all
    end
  end
end
