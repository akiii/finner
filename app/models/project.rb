class Project < ActiveRecord::Base
  attr_accessible :description, :name, :open, :released, :url, :icon
  has_attached_file :icon, :styles => { :large => '300x300>', :medium => '100x100>', :small => '30x30>', :thumb => '50x50>' }, :default_url => '/assets/icons/:style/missing.png'

  def users
    users = []
    Participant.find_all_by_project_id_and_is_allowed(self.id, true).each do |p|
      users << p.user
    end
    return users
  end

  def requesters
    users = []
    Participant.find_all_by_project_id_and_is_allowed(self.id, false).each do |p|
      users << p.user
    end
    return users
  end

  def is_participate(user)
    if Participant.find_by_project_id_and_user_id_and_is_allowed(self.id, user.id, true)
      return true
    else
      return false
    end
  end

  def recieved_request(user)
    if Participant.find_by_project_id_and_user_id(self.id, user.id)
      return true
    else
      return false
    end
  end

end
