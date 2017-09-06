class Api::SessionsController < ApiController
	skip_before_action :require_login, only: [:create], raise: false

  	  
  	def create
    	if student = Student.valid_login?(params[:email], params[:password])
      		send_student(student)
      		session[:student_id] = student.id
    	else
        	render_unauthorized("Email ou senha incorreto!")
   		end
  	end

  	def destroy
  		session[:student_id] = nil
    	head :ok
  	end

    def return_student
      render json: current_student
    end

  	private

  	def send_student(student)
      	render json: student
  	end
end
