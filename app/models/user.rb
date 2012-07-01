class User < ActiveRecord::Base
  attr_accessible :account, :email, :password, :profile, :university_department_relationship_id, :icon
  has_attached_file :icon, :styles => { :large => '300x300>', :medium => '100x100>', :small => '30x30>', :thumb => '50x50>' }, :default_url => '/assets/icons/:style/missing.png'

  validates :account, :uniqueness => true, :length => 2..16
  validates :password, :length => 4..16
  validates :profile, :length => 0..300
  validates :email, :format => { :with => /^(.+)@(.+)\.(.+)$/ }

  def university
    return UniversityDepartmentRelationship.find(self.university_department_relationship_id).university
  end

  def department
    return UniversityDepartmentRelationship.find(self.university_department_relationship_id).department
  end

  def friends
    contacts = Contact.where('from_user_id = ?', self.id)
    friends = []
    contacts.each do |c|
      if Contact.find_by_to_user_id_and_from_user_id(c.from_user_id, c.to_user_id)
        friends << User.find(c.to_user_id)
      end
    end
    contacteds = Contact.where('to_user_id = ?', self.id)
    return friends
  end

  def is_send_contact(to_user)
    if Contact.find_by_to_user_id_and_from_user_id(to_user.id, self.id)
      return true
    else
      return false
    end
  end

  def is_received_contact(from_user)
    if Contact.find_by_to_user_id_and_from_user_id(self.id, from_user.id)
      return true
    else
      return false
    end
  end

end
