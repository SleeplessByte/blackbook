class InteractionAssociations < SimpleDelegator

  def encounter_interactions
    @encounter_interactions ||= EncounterInteractionRepository.find_by_interaction( self.id ).all
  end

  def encounters
    # TODO move to associations? this is a join object?
    @encounters ||= encounter_interactions.map { |ei| EncounterRepository.find( ei.encounter_id ) }
  end

end