class StartupController < ApplicationController
	layout "startup"
	before_action :authenticate_admin!
	before_action :authenticate_admin_manager!

	def authenticate_admin_manager!
  		if !current_admin.manager?
  			redirect_to school_root_path(current_admin.school)
  		end
  	end
end
