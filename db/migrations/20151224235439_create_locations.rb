Hanami::Model.migration do
  change do
    create_table :locations do
      primary_key :id

      foreign_key :location_type_id, type: Integer, null: false

      column :name,             String,   null: false,  index: true
      column :street,           String,   null: false
      column :postal,           String,   null: false
      column :city,             String,   null: false
      column :state,            String,   null: true
      column :country,          String,   null: false
      column :facebook_id,      Integer,  null: true

      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
end
