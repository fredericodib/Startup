class School::AdminsController < SchoolController

	def new
		@admin = Admin.new
  	end

	def create
		@admin = Admin.new(params_admin)
		@admin.school = @school
	  	if @admin.save
	    	redirect_to school_root_path(@school), notice: 'Administrador criado com sucesso.'
	  	else
	    	render :new
	  	end
	end

	def index
		@admins = Admin.all.where(school: @school)
	end

	def show
		@admin = Admin.find(params[:id])
	end

	def destroy
		@admin = Admin.find(params[:id])
	  	if @admin.destroy
      		redirect_to school_root_path(@school), notice: "Administrador excluido com sucesso."
    	else
      		render :index
    	end
	end


	private

	def params_admin
      	params.require(:admin).permit(:name, :email, :password, :password_confirmation, :cpf, :phone, :role)
  	end

end
