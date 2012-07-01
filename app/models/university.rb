class University < ActiveRecord::Base
  attr_accessible :name

  def self.exist(name)
    if University.find_by_name(name)
      return true
    else
      return false
    end
  end

  def departments
    outs = []
    udrs = UniversityDepartmentRelationship.find_all_by_university_id(self.id)
    udrs.each do |udr|
      outs << udr.department
    end
    return outs
  end

end
