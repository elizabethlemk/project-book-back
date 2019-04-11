class RemoveColorFromProject < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :color, :string
  end
end
