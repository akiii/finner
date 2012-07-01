class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :to_user_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end
