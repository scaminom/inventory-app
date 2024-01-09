class AddColumnCode < ActiveRecord::Migration[7.1]
  def change
    add_column :computers, :code, :string
  end
end
