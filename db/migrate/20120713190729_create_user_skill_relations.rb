class CreateUserSkillRelations < ActiveRecord::Migration
  def change
    create_table :user_skill_relations do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
