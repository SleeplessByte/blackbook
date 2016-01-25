Hanami::Model.migration do
  change do
    create_table :interactions do
      primary_key :id

      column :name,             String,   null: false
      column :symbol,           String,   null: true
      column :risk_factor,      Integer,  null: false

      column :created_at,       DateTime
      column :updated_at,       DateTime
    end
  end
end
