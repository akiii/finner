class Contact < ActiveRecord::Base
  attr_accessible :from_user_id, :to_user_id

  def self.exist(to_user_id, from_user_id)
    if Contact.find_by_to_user_id_and_from_user_id(to_user_id, from_user_id)
      return true
    else
      return false
    end
  end

end
