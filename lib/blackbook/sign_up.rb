require 'bcrypt'
require_relative 'entities/user'

class SignUp
  include Hanami::Validations
  include BCrypt

  attribute :password, presence: true, size: (9...64), confirmation: true
  attribute :username, presence: true, format: /\A[A-z0-9_-]{4,64}\Z/
  attribute :email, presence: true, format: /@/

  def create
    User.new(
        password: Password.create( self.password ),
        username: username,
        email: email
    )
  end
end