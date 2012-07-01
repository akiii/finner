class Department < ActiveRecord::Base
  attr_accessible :name

  def self.exist(name)
    if Department.find_by_name(name)
      return true
    else
      return false
    end
  end

  def universities
    outs = []
    udrs = UniversityDepartmentRelationship.find_all_by_department_id(self.id)
    udrs.each do |udr|
      outs << udr.university
    end
    return outs
  end

end
