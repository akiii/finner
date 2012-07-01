
class ContactsController < ApplicationController
  before_filter :session_exist

  def send_with_to_user_id
    unless Contact.exist(params[:to_user_id], current_user.id)
      Contact.create(:to_user_id => params[:to_user_id], :from_user_id => current_user.id)
    end
  end

end
