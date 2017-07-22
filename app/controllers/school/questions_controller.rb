class School::QuestionsController < SchoolController

	def new
		@question = Question.new
		@quiz = Quiz.find(params[:quiz_id])
	end

	def create
		@question = Question.new(params_question)
		@quiz = Quiz.find(params[:quiz_id])
		@question.quiz = @quiz
	  	if @question.save
	    	redirect_to school_quiz_path(@school, @quiz), notice: 'Questão cadastrada com sucesso.'
	  	else
	    	render :new
	  	end
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def params_question
      	params.require(:question).permit(:number)
  	end

end
