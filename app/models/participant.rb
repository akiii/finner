class Participant < ActiveRecord::Base
  attr_accessible :authority, :isAllowed, :project_id, :user_id
  belongs_to :project
  belongs_to :user
end
