class EncounterAssociations < SimpleDelegator

  def actor
    @actor ||= ActorRepository.find( self.actor_id )
  end

  def user
    @user ||= ActorAssociations.new( actor ).user
  end

  def location
    @locations ||= LocationRepository.find( self.location_id )
  end

  def location_type
    @location_type ||= LocationAssociations.new( location ).location_type
  end

  def encounter_interactions
    @encounter_interactions ||= EncounterInteractionRepository.find_by_encounter( self.id ).all
  end

  def interactions
    # TODO move to associations? this is a join object?
    @interactions ||= encounter_interactions.map { |ei| InteractionRepository.find( ei.interaction_id ) }
  end

  def risk_factor
    @risk_factors ||= interactions.collect( &:risk_factor ).max
  end

end