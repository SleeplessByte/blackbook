require_relative 'params'
require_relative 'set_actor'

module Web::Controllers::Actors
  class Update
    include Web::Action
    include Params
    include SetActor

    def call( params )
      if params.valid?
        update_params = params[ :actor ]
        @actor.update( update_params )
        if @actor.valid?
          ActorRepository.update( @actor )
          redirect_to routes.actor_path( @actor.id )
        end
      end
    end
  end
end
