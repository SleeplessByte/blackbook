class Actor
  include Hanami::Entity
  include Hanami::Validations

  attribute :user_id,         type: Integer,  presence: true
  attribute :name_first,      type: String,   presence: true
  attribute :name_last,       type: String
  attribute :date_of_birth,   type: Date
  attribute :day_of_birth,    type: Integer,  size: (1..365)
  attribute :facebook_id,     type: String
  attribute :foreskin_flag,   type: Boolean
  attribute :phone,           type: String,   format: /(?:\A\Z)|(?:\A\+?[0-9]+(?:(?:[- .][0-9]+)|\([0-9]+\))*\Z)/, size: (10..20)
  attribute :email,           type: String,   format: /(?:\A\Z)|@/, size: (5..255)
  attribute :kys_date,        type: Date
  attribute :kys_status,      type: String
  attribute :favourite_flag,  type: Boolean
  attribute :hidden_flag,     type: Boolean

  attribute :created_at,      type: DateTime
  attribute :updated_at,      type: DateTime
end
