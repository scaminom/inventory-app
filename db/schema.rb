ActiveRecord::Schema[7.1].define(version: 20_231_214_042_728) do
  enable_extension 'plpgsql'

  create_table 'computers', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'laboratories', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'peripherals', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.bigint 'computer_id', null: false
    t.index ['computer_id'], name: 'index_peripherals_on_computer_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.integer 'role', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'jti', null: false
    t.string 'first_name'
    t.string 'last_name'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['jti'], name: 'index_users_on_jti', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  add_foreign_key 'peripherals', 'computers'
end
