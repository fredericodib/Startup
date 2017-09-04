class Api::ProdutivitiesController < ApiController

	def create
    if params[:array]
      create_multiple_objects
      render json: nil
      
    else
    	@productivity = Productivity.new(productivity_params)
    	@productivity.student = current_student

  		if @productivity.save
    		render json: nil
  		else
        byebug
    		render json: @productivity.errors, status: :unprocessable_entity
  		end
    end
	end

	def list_disciplines
		@student = current_student
		@type = @student.school.school_type
		@disciplines = Discipline.all.where(discipline_type: @type)
		render json: @disciplines
	end

	def produtivity_informations
		@productivity = Productivity.find_productivity(params[:rengeTime], params[:customRangeBeginning], params[:customRangeEnd], current_student, params[:discipline])
		@data = Productivity.organize_data(@productivity, params[:discipline])
		render json: @data
	end

	private

  	def productivity_params
  		params.require(:productivity).permit(:total_questions, :correct_questions, :time_studed, :discipline_id)
  	end

    def create_multiple_objects
      @productivity = []
      params[:array].each do |elem|
        @productivity = Productivity.new(elem.require(:productivity).permit(:total_questions, :correct_questions, :time_studed, :discipline_id))
        @productivity.student = current_student
        @productivity.save
      end
    end

end
