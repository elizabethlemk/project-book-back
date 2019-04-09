class RemoveVideoFromProjects < ActiveRecord::Migration[5.2]
  def change
    remove_column :projects, :video, :string
  end
end
