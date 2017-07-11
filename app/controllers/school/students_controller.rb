class School::StudentsController < SchoolController
	before_action :authenticate_coordenator, only: [:new, :create, :edit, :update, :destroy]

	def new
		@student = Student.new
  	end

	def create
		@student = Student.new(params_student)
		@student.school = @school
	  	if @student.save
	    	redirect_to school_students_path(@school), notice: 'Aluno criado com sucesso.'
	  	else
	    	render :new
	  	end
	end

	def index
		@students = Student.all.where(school: @school)
	end

	def show
		@student = Student.find(params[:id])
	end

	def edit
		@student = Student.find(params[:id])
	end

	def update
		@student = Student.find(params[:id])
	  	if @student.update(update_params_student)
	    	redirect_to school_students_path(@school), notice: 'Aluno editado com sucesso.'
	  	else
	    	render :edit
	  	end
	end

	def destroy
		@student = Student.find(params[:id])
	  	if @student.destroy
      		redirect_to school_students_path(@school), notice: "Aluno excluido com sucesso."
    	else
      		render :index
    	end
	end


	private

	def params_student
      	params.require(:student).permit(:name, :email, :password, :password_confirmation, :student_class, :gender, :registration, :birthday)
  	end

  	def update_params_student
  		if password_blank?
        	params[:student] = params[:student].except(:password, :password_confirmation)
      	end
      	params.require(:student).permit(:name, :password, :password_confirmation, :student_class, :gender, :registration, :birthday)
  	end

  	def password_blank?
      params[:student][:password].blank? &&
      params[:student][:password_confirmation].blank?
    end

end
