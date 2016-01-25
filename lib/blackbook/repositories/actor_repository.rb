class ActorRepository
  include Hanami::Repository

  def self.find_for_user( user_id )
    query do
      where( user_id: user_id )
    end
  end

  def self.find_most_recent_for_user( user_id )
    encounter = EncounterRepository.find_for_user(user_id)
                  .where( hidden_flag: false )
                  .desc(:interaction_at )
                  .limit(1)
                  .first

    return nil unless encounter
    find( encounter.actor_id )
  end

  def self.find_most_encountered_for_user( user_id )
    encounter = EncounterRepository.group_by_actor_for_user( user_id )
                    .sort( &:length )
                    .last
    return nil unless encounter
    find( encounter.actor_id )
  end

  def self.find_newest_for_user( user_id )
    find_for_user( user_id )
      .where( hidden_flag: false )
      .desc( :created_at )
      .limit( 1 )
      .first
  end

end
