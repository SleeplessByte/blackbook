class LocationRepository
  include Lotus::Repository

  def self.find_for_user( user_id )
    query do
      where( user_id: user_id )
    end
  end

end
