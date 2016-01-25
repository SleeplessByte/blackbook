class UserRepository
  include Lotus::Repository

  def self.find_by_username( username )
    query do
      where( username: username ).limit( 1 )
    end.first
  end

end
