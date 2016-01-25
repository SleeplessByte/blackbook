Hanami::Model.migration do
  change do
    create_table :actors do
      primary_key :id

      column :name_first,       String,   null: false
      column :name_last,        String,   null: true
      column :date_of_birth,    Date,     null: true
      column :day_of_birth,     Integer,  null: true
      column :facebook_id,      String,   null: true
      column :phone,            String,   null: true
      column :email,            String,   null: true
      column :sex,              String,   null: false
      column :foreskin_flag,    Boolean,  null: true
      column :kys_date,         Date,     null: true
      column :kys_status,       String,   null: true
      column :favourite_flag,   TrueClass,  null: false,  index: true
      column :hidden_flag,      TrueClass,  null: false,  index: true

      column :created_at,       DateTime, index: true
      column :updated_at,       DateTime
    end
  end
end
