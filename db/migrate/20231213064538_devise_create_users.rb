class DeviseCreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :username,           null: false
      t.string :email,              null: false, default: ''
      t.string :encrypted_password, null: false, default: ''
      t.references :manager, foreign_key: { to_table: :users }, index: true
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :username,             unique: true
  end
end
