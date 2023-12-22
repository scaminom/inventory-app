class CreateCustodians < ActiveRecord::Migration[7.1]
  def change
    create_table :custodians do |t|
      t.string :first_name
      t.string :last_name
      t.string :degree
      t.references :supervisor, null: false, foreign_key: { to_table: :users }, index: true
    end
  end
end
