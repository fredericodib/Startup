class Api::CronometerLogsController < ApiController

	def create
    if params[:array]
      create_multiple_objects
      render json: current_student.cronometer_logs.order(date: :desc)

    else
    	@cronometer = CronometerLog.new(cronometer_params)
    	@cronometer.student = current_student

  		if @cronometer.save
    		render json: current_student.cronometer_logs.order(date: :desc)
  		else
    		render json: @cronometer.errors, status: :unprocessable_entity
  		end
    end
	end

  def list_of_time_logs
    render json: current_student.cronometer_logs.order(date: :desc)
  end


	private

    def create_multiple_objects
      @cronometer_logs = []
      params[:array].each do |elem|
        @cronometer_logs = CronometerLog.new(elem.require(:cronometer_log).permit(:time, :discipline_id, :date))
        @cronometer_logs.student = current_student
        @cronometer_logs.save
      end
    end

  	def cronometer_params
  		params.require(:cronometer_log).permit(:time, :discipline_id, :date)
  	end
end
