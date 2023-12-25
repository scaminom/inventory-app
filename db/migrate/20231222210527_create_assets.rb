class CreateAssets < ActiveRecord::Migration[7.1]
  def change
    create_table :assets do |t|
      t.string :name
      t.string :description
      t.boolean :stock
      t.integer :amount
      t.references :computer, null: true, foreign_key: true
      t.references :custodian, polymorphic: true, index: true
      t.references :laboratory, null: false, foreign_key: true
    end
  end
end
