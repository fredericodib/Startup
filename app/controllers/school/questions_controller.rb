class School::QuestionsController < SchoolController

	def new
		@question = Question.new
		@quiz = Quiz.find(params[:quiz_id])
		@disciplines = Discipline.all.where(discipline_type: @school.school_type)
		@topics = @disciplines.first.topics

		if @quiz.questions.any?
			@question.number = @quiz.questions.last.number + 1
		else
			@question.number = 1
		end

		@question.choices << Choice.new(text: "A)")
		@question.choices << Choice.new(text: "B)")
		@question.choices << Choice.new(text: "C)")
		@question.choices << Choice.new(text: "D)")
		@question.choices << Choice.new(text: "E)")
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
		@disciplines = Discipline.all.where(discipline_type: @school.school_type)
		@topics = @question.discipline.topics
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

	def topics
		@discipline = Discipline.find(params[:id])
		@topics = @discipline.topics
		render :file => "/school/questions/topic.js.erb"
	end

	private

	def params_question
      	params.require(:question).permit(:number, :comment, :discipline_id, choices_attributes: [:id, :text, :correct, :_destroy], topic_ids: [])
  	end

end
