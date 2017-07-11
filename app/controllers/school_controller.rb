class SchoolController < ApplicationController
	layout "school"
	before_action :authenticate_admin!
	before_action :authenticate_correct_school!
	before_action :set_school

	def authenticate_correct_school!
  		if ((!current_admin.manager?) && ((current_admin.school.id).to_s != params[:school]))
  			redirect_to school_root_path(current_admin.school)
  		end
  		if ((current_admin.manager?) && !(School.exists?(params[:school])))
  			redirect_to startup_schools_path
  		end
  	end

  	def set_school
  		@school = School.find(params[:school])
  	end

    def authenticate_coordenator
      if current_admin.teacher?
        redirect_to school_root_path(current_admin.school)
      end
    end
end
