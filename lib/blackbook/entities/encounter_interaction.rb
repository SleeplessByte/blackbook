class EncounterInteraction
  include Lotus::Entity
  include Lotus::Validations

  attribute :interaction_id,  type: Integer,  presence: true
  attribute :encounter_id,    type: Integer,  presence: true

  attribute :created_at,      type: DateTime
end
