class ActorAssociations < SimpleDelegator

  def encounters
    @encounters ||= EncounterRepository.find_by_actor( self.id ).all
  end

  def user
    @user ||= UserRepository.find( self.user_id )
  end

  def locations
    @locations ||= LocationRepository.find( encounters.describe( :location_id ) )
  end

end