class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :project_id
      t.integer :idx
      t.string :comment

      t.timestamps
    end
  end
end
