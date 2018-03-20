class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
  	if(current_user.role=='user')
  		user_path(current_user)
  	elsif(current_user.role=='super_admin')
  		rails_admin.dashboard_path
  	else
  		admin_path
  	end
  end
end
