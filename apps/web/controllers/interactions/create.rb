require_relative 'params'

module Web::Controllers::Interactions
  class Create
    include Web::Action
    include Params

    expose :interaction

    def call( params )
      @interaction = Interaction.new( params[ :interaction ] )

      if params.valid?
        @interaction = InteractionRepository.create( @interaction )
        redirect_to routes.interaction_path( @interaction.id ) #if @actor.valid?
      end
    end
  end
end
