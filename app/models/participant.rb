class Participant < ActiveRecord::Base
  attr_accessible :authority, :isAllowed, :project_id, :user_id
end
