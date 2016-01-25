class EncounterRepository
  include Hanami::Repository

  def self.find_by_actor( actor_id )
    query do
      where( actor_id: actor_id )
    end
  end

  def self.find_by_location( location_id )
    query do
      where( location_id: location_id )
    end
  end

  def self.find_for_user( user_id )
    query do
      join( :actors, id: :actor_id )
        .where( user_id: user_id )
    end
  end

  def self.group_by_actor_for_user(user_id)
    find_for_user( user_id )
        .all
        .inject( {} ) { |grouped, encounter|  ( grouped[ encounter.actor_id] ||= [] ) << encounter }
        #.group_and_count( :actor_id )
  end

end
