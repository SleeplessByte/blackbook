module Web::Controllers::Interactions
  class New
    include Web::Action

    expose :interaction

    def call( params )
      @interaction = Interaction.new
    end
  end
end
