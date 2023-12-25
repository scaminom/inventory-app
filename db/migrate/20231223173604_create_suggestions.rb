class CreateSuggestions < ActiveRecord::Migration[7.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.string :description
      t.integer :status, null: false, default: 0
      t.references :asset, null: false, foreign_key: true
      t.references :suggestor, polymorphic: true, index: true
    end
  end
end
