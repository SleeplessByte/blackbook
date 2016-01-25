Hanami::Model.migration do
  change do
    create_table :location_types do
      primary_key :id

      column :name,             String,   null: false

      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
end
