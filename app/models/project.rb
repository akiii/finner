class Project < ActiveRecord::Base
  attr_accessible :description, :name, :open, :released, :url, :icon
  has_attached_file :icon, :styles => { :large => '300x300>', :medium => '100x100>', :small => '30x30>', :thumb => '50x50>' }, :default_url => '/assets/icons/:style/missing.png'

end
