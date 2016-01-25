module Web::Controllers::Encounters
  module SetEncounter
    def self.included( action )
      action.class_eval do
        before :set_encounter
        expose :encounter
        handle_exception RecordNotFound => 404
        handle_exception Forbidden => 403
      end
    end

    private

    def set_encounter( params )
      @encounter = EncounterRepository.find( params[:id] ) or raise RecordNotFound.new(
          "Looking for encounter with id = #{params[:id]}" )

      actor = ActorRepository.find( @encounter.actor_id )
      raise Forbidden.new if actor && current_user.id != actor.user_id
    end
  end
end