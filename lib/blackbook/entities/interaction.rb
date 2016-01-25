class Interaction
  include Lotus::Entity
  include Lotus::Validations

  attribute :name,          type: String,  presence: true
  attribute :symbol,        type: String

  attribute :risk_factor,   type: Integer

  attribute :created_at,    type: DateTime
  attribute :updated_at,    type: DateTime
end
