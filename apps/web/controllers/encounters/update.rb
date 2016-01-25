require_relative 'params'
require_relative 'set_encounter'

module Web::Controllers::Encounters
  class Update
    include Web::Action
    include Params
    include SetEncounter

    def call( params )
      if params.valid?
        update_params = params[ :encounter ]
        @encounter.update( update_params )
        if @encounter.valid?
          EncounterRepository.update( @encounter )
          redirect_to routes.encounter_path( @encounter.id )
        end
      end
    end
  end
end
