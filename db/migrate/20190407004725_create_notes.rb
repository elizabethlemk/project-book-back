class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.integer :project_id
      t.string :type_name
      t.string :comment

      t.timestamps
    end
  end
end
