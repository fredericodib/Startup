class Api::QuizController < ApiController
	before_action :require_login

	def render_quizes
		@quizes = current_student.school.quiz
		render json: @quizes.to_json(:include => { :questions => { :include => :choices }})
	end
end
