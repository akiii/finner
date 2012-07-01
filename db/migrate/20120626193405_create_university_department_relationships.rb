class CreateUniversityDepartmentRelationships < ActiveRecord::Migration
  def change
    create_table :university_department_relationships do |t|
      t.integer :university_id
      t.integer :department_id

      t.timestamps
    end
  end
end
