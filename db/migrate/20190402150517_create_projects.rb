class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.string :color
      t.string :links
      t.string :video
      t.string :mood_board
      t.boolean :completed

      t.timestamps
    end
  end
end
