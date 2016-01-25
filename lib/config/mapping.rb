collection :actors do
  entity     Actor
  repository ActorRepository

  attribute :id,              Integer
  attribute :user_id,         Integer
  attribute :name_first,      String
  attribute :name_last,       String
  attribute :date_of_birth,   Date
  attribute :day_of_birth,    Integer
  attribute :facebook_id,     String
  attribute :phone,           String
  attribute :email,           String
  attribute :foreskin_flag,   Boolean
  attribute :kys_date,        Date
  attribute :kys_status,      String
  attribute :favourite_flag,  Boolean
  attribute :hidden_flag,     Boolean
  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end

collection :encounters do
  entity     Encounter
  repository EncounterRepository

  attribute :id,              Integer
  attribute :location_id,     Integer
  attribute :actor_id,        Integer
  attribute :interaction_at,  DateTime
  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end

collection :locations do
  entity     Location
  repository LocationRepository

  attribute :id,              Integer
  attribute :user_id,         Integer
  attribute :location_type_id, Integer
  attribute :name,            String
  attribute :street,          String
  attribute :postal,          String
  attribute :city,            String
  attribute :state,           String
  attribute :country,         String
  attribute :facebook_id,     String
  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end

collection :interactions do
  entity     Interaction
  repository InteractionRepository

  attribute :id,              Integer
  attribute :name,            String
  attribute :symbol,          String
  attribute :risk_factor,     Integer
  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end

collection :location_types do
  entity     LocationType
  repository LocationTypeRepository

  attribute :id,              Integer
  attribute :name,            String
  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end

collection :encounter_interactions do
  entity     EncounterInteraction
  repository EncounterInteractionRepository

  attribute :id,              Integer
  attribute :encounter_id,    Integer
  attribute :interaction_id,  Integer
  attribute :created_at,      DateTime
end

collection :users do
  entity     User
  repository UserRepository

  attribute :id,              Integer
  attribute :username,        String
  attribute :password,        String
  attribute :email,           String

  attribute :created_at,      DateTime
  attribute :updated_at,      DateTime
end