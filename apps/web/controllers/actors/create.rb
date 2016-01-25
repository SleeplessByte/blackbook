require_relative 'params'

module Web::Controllers::Actors
  class Create
    include Web::Action
    include Params

    expose :actor

    def call( params )
      @actor = Actor.new( params[ :actor ] )
      @actor.user_id = current_user.id

      [:phone, :email, :date_of_birth, :facebook_id ].each do |key|
        val = @actor.send( key )
        @actor.send( "#{key}=", nil ) if !val || val.empty?
      end

      if params.valid?
        @actor = ActorRepository.create( @actor )
        redirect_to routes.actor_path( @actor.id ) #if @actor.valid?
      end
    end
  end
end
