class Skill < ActiveRecord::Base
  attr_accessible :name, :skill_category_id
  belongs_to :skill_category
end
