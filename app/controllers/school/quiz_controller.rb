class School::QuizController < SchoolController

	def new
		@quiz = Quiz.new
	end

	def create
		@quiz = Quiz.new(params_quiz)
		@quiz.school = @school
	  	if @quiz.save
	    	redirect_to school_quiz_path(@school, @quiz), notice: 'Prova criada com sucesso.'
	  	else
	    	render :new
	  	end
	end

	def index
		@quiz = Quiz.all.where(school: @school)
	end

	def edit
		@quiz = Quiz.find(params[:id])
	end

	def update
		@quiz = Quiz.find(params[:id])
	  	if @quiz.update(params_quiz)
	    	redirect_to school_quiz_path(@school, @quiz), notice: 'Prova editada com sucesso.'
	  	else
	    	render :edit
	  	end
	end

	def show
		@quiz = Quiz.find(params[:id])
		@questions = @quiz.questions.order(:number)
	end

	def destroy
		@quiz = Quiz.find(params[:id])
	  	if @quiz.destroy
      		redirect_to school_quiz_index_path(@school), notice: "Prova excluida com sucesso."
    	else
      		render :index
    	end
	end


	private

	def params_quiz
      	params.require(:quiz).permit(:name)
  	end
end
