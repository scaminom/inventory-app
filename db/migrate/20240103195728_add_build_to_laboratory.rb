class AddBuildToLaboratory < ActiveRecord::Migration[7.1]
  def change
    add_column :laboratories, :build, :integer, null: false
  end
end
