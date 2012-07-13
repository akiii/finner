class CreateUserSkillRelationships < ActiveRecord::Migration
  def change
    create_table :user_skill_relationships do |t|
      t.integer :user_id
      t.integer :skill_id

      t.timestamps
    end
  end
end
