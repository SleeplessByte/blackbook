class UserAssociations < SimpleDelegator

  def actors
    @actors ||= ActorRepository.find_for_user(self.id )
  end

  def locations
    @locations ||= LocationRepository.find_for_user( self.id )
  end

end