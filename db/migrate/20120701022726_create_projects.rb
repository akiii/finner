class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :url
      t.boolean :open
      t.boolean :released
      t.string :icon

      t.string :icon_file_name
      t.integer :icon_file_size
      t.string :icon_content_type
      t.datetime :icon_updated_at

      t.timestamps
    end
  end
end
