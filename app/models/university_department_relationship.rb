class UniversityDepartmentRelationship < ActiveRecord::Base
  attr_accessible :department_id, :university_id
  belongs_to :university
  belongs_to :department

  def self.exist(university, department)
    if UniversityDepartmentRelationship.find_by_university_id_and_department_id(university.id, department.id)
      return true
    else
      return false
    end
  end

end
