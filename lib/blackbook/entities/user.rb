require 'bcrypt'

class User
  include Lotus::Entity
  include Lotus::Validations
  include BCrypt

  attribute :username,        type: String, presence: true
  attribute :email,           type: String, presence: true
  attribute :password,        type: String, presence: true

  attribute :created_at,      type: DateTime
  attribute :updated_at,      type: DateTime

  def authenticate?( password )
    self.password == password
  end

  def password
    @password || Password.new( @attributes[ :password ] )
  end
end
