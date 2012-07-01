class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :email
      t.integer :university_department_relationship_id
      t.text :profile

      t.string :icon

      t.string :icon_file_name
      t.integer :icon_file_size
      t.string :icon_content_type
      t.datetime :icon_updated_at

      t.timestamps
    end
  end
end
