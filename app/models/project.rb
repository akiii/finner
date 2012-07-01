class Project < ActiveRecord::Base
  attr_accessible :description, :name, :open, :released, :url, :icon
  has_attached_file :icon, :styles => { :large => '300x300>', :medium => '100x100>', :small => '30x30>', :thumb => '50x50>' }, :default_url => '/assets/icons/:style/missing.png'

  def users
    users = []
    Participant.find_all_by_project_id(self.id).each do |p|
      users << p.user
    end
    return users
  end

end
