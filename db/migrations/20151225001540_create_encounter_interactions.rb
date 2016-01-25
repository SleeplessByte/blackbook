Lotus::Model.migration do
  change do
    create_table :encounter_interactions do
      primary_key :id

      foreign_key :encounter_id, :encounters, type: Integer, null: false
      foreign_key :interaction_id, :interactions, type: Integer, null: false

      column :created_at,       DateTime
    end
  end
end
