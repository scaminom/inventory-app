class CreatePeripherals < ActiveRecord::Migration[7.1]
  def change
    create_table :peripherals do |t|
      t.string :name
      t.string :description
      t.references :computer, null: false, foreign_key: true
    end
  end
end
