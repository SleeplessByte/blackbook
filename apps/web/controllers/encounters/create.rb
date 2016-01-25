require_relative 'params'

module Web::Controllers::Encounters
  class Create
    include Web::Action
    include Params

    expose :encounter

    def call( params )
      @encounter = Encounter.new( params[ :encounter ] )

      if params.valid?
        # test @encounter.location_id 403
        # test @encounter.actor_id 403
        @encounter = EncounterRepository.create( @encounter )
        redirect_to routes.encounter_path( @encounter.id ) #if @actor.valid?
      end
    end
  end
end
