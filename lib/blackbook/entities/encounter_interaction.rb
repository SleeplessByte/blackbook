class EncounterInteraction
  include Hanami::Entity
  include Hanami::Validations

  attribute :interaction_id,  type: Integer,  presence: true
  attribute :encounter_id,    type: Integer,  presence: true

  attribute :created_at,      type: DateTime
end
