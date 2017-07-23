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
		@question = Question.find(params[:id])
		@quiz = Quiz.find(params[:quiz_id])
	end

	def update
		@question = Question.find(params[:id])
		@quiz = Quiz.find(params[:quiz_id])
	  	if @question.update(params_question)
	    	redirect_to school_quiz_path(@school, @quiz), notice: 'Questão editada com sucesso.'
	  	else
	    	render :edit
	  	end
	end

	def destroy
		@question = Question.find(params[:id])
		@quiz = Quiz.find(params[:quiz_id])
	  	if @question.destroy
      		redirect_to school_quiz_path(@school, @quiz), notice: "Prova excluida com sucesso."
    	else
      		render school_quiz_path(@school, @quiz)
    	end
	end

	private

	def params_question
      	params.require(:question).permit(:number, :comment, choices_attributes: [:id, :text, :correct, :_destroy])
  	end

end
