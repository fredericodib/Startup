class ApiController < ActionController::Base

	def require_login
    	if current_student == nil
    		respond_to do |format|
  				format.html { redirect_to root_path, alert: "Acesso negado!" }
        		format.json { render_unauthorized("Acesso negado!") }
		  	end
    	end
  	end

  	def current_student
    	@current_student ||= authenticate_token
    	if @current_student
    		return @current_student
    	end
    	if Student.exists?(session[:student_id])
    		return @current_student ||= Student.find(session[:student_id])
    	end
    
    	return nil
  	end

  	protected

  	def render_unauthorized(message)
    	errors = { errors: { detail: message } }
    	render json: errors, status: :unauthorized
  	end

  	private

  	def authenticate_token
    	authenticate_with_http_token do |token, options|
     		student = Student.find_by(token: token)
    	end
  	end  
end
