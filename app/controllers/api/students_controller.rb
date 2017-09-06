class Api::StudentsController < ApiController
	before_action :require_login

	def update
		@student = current_student
	  	if @student.update(update_params_student)
	    	render json: @student
	  	else
	    	render json: @student.errors.full_messages, status: 422
	  	end
	end

	private

  	def update_params_student
  		if password_blank?
        	params[:student] = params[:student].except(:password, :password_confirmation)
      	end
      	params.require(:student).permit(:name, :password, :password_confirmation, :student_class, :gender, :registration, :birthday)
  	end

  	def password_blank?
      params[:student][:password].blank? &&
      params[:student][:password_confirmation].blank?
    end

end
