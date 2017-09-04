class Api::CronometerLogsController < ApiController

	def create
    	@cronometer = CronometerLog.new(cronometer_params)
    	@cronometer.student = current_student
  		if @cronometer.save
    		render json: nil
  		else
  			byebug
    		render json: @cronometer.errors, status: :unprocessable_entity
  		end
  	end


  	private

    	def cronometer_params
    		params.require(:cronometer_log).permit(:time, :discipline_id)
    	end
end
