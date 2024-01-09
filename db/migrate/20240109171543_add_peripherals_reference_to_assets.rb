class AddPeripheralsReferenceToAssets < ActiveRecord::Migration[7.1]
  def change
    add_reference :peripherals, :asset, foreign_key: true, null: true
  end
end
