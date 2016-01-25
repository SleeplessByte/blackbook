Hanami::Model.migration do
  change do
    create_table :encounters do
      primary_key :id

      foreign_key :actor_id, :actors, type: Integer, null: false
      foreign_key :location_id, :locations, type: Integer, null: false

      column :interaction_at,   DateTime, null: false, index: true
      
      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
end
