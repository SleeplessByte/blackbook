Lotus::Model.migration do
  change do
    create_table :users do
      primary_key :id

      column :username,         String,   null: false, unique: true, index: true
      column :password,         String,   null: false
      column :email,            String,   null: false, unique: true, index: true

      column :created_at,       DateTime
      column :updated_at,       DateTime
    end

    alter_table :actors do
      add_foreign_key :user_id, :users
    end

    alter_table :locations do
      add_foreign_key :user_id, :users
    end
  end
end
