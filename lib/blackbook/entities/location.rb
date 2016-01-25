class Location
  include Lotus::Entity
  include Lotus::Validations

  attribute :location_type_id, type: Integer, presence: true
  attribute :user_id,         type: Integer, presence: true

  attribute :street,          type: String
  attribute :postal,          type: String
  attribute :city,            type: String
  attribute :state,           type: String
  attribute :country,         type: String
  attribute :facebook_id,     type: String

  attribute :name,            type: String, presence: true

  attribute :created_at,      type: DateTime
  attribute :updated_at,      type: DateTime
end
