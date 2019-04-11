class CreateColors < ActiveRecord::Migration[5.2]
  def change
    create_table :colors do |t|
      t.integer :project_id
      t.string :color_hex
      t.timestamps
    end
  end
end
