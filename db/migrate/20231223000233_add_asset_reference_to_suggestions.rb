class AddAssetReferenceToSuggestions < ActiveRecord::Migration[7.1]
  def change
    add_reference :suggestions, :asset, null: false, foreign_key: true
  end
end
