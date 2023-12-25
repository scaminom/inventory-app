class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.text :message, null: true
      t.references :suggestion, null: false, foreign_key: true
      t.references :actor, polymorphic: true, index: true
    end
  end
end
