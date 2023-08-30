class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :archived
      t.boolean :favorite
      t.integer :priority

      t.timestamps
    end
  end
end
