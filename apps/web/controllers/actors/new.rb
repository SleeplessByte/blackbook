module Web::Controllers::Actors
  class New
    include Web::Action

    expose :actor

    def call( params )
      @actor = Actor.new( params )
      @actor.user_id = current_user.id
    end
  end
end
