class LocationAssociations < SimpleDelegator

  def user
    @user ||= UserRepository.find( self.user_id )
  end

  def encounters
    @encounters ||= EncounterRepository.find_by_location( self.id ).all
  end

  def location_type
    @location_type ||= LocationTypeRepository.find( self.location_type_id )
  end

end