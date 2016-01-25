module Web::Controllers::Actors
  module SetActor
    def self.included( action )
      action.class_eval do
        before :set_actor
        expose :actor
        handle_exception RecordNotFound => 404
        handle_exception Forbidden => 403
      end
    end

    private

    def set_actor( params )
      @actor = ActorRepository.find( params[:id] ) or raise RecordNotFound.new( "Looking for actor with id = #{params[:id]}" )
      raise Forbidden.new if current_user.id != @actor.user_id
    end
  end
end