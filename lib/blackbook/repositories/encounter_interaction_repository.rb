class EncounterInteractionRepository
  include Lotus::Repository

  def self.find_by_encounter( id )
    query do
      where( encounter_id: id )
    end
  end

  def self.find_by_interaction( id )
    query do
      where( interaction_id: id )
    end
  end

end
