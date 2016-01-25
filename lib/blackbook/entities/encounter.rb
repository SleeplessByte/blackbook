class Encounter
  include Hanami::Entity
  include Hanami::Validations

  attribute :actor_id,        type: Integer,  presence: true
  attribute :location_id,     type: Integer

  attribute :interaction_at,  type: DateTime

  attribute :created_at,      type: DateTime
  attribute :updated_at,      type: DateTime
end
