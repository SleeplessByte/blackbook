require_relative 'params'
require_relative 'set_interaction'

module Web::Controllers::Interactions
  class Update
    include Web::Action
    include Params
    include SetInteraction

    def call( params )
      if params.valid?
        update_params = params[ :interaction ]
        @interaction.update( update_params )
        if @interaction.valid?
          InteractionRepository.update( @interaction )
          redirect_to routes.interaction_path( @interaction.id )
        end
      end
    end
  end
end
