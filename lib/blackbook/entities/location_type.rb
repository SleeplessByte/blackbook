class LocationType
  include Hanami::Entity
  include Hanami::Validations

  attribute :name,            type: String, presence: true

  attribute :created_at,      type: DateTime
  attribute :updated_at,      type: DateTime
end
