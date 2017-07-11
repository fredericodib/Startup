class Startup::AdminsController < StartupController

	def new
		@admin = Admin.new
  	end

	def create
		@admin = Admin.new(params_admin)
	  	if @admin.save
	  		@admin.manager!
	    	redirect_to startup_admins_path, notice: 'Administrador criado com sucesso.'
	  	else
	    	render :new
	  	end
	end

	def index
		@admins = Admin.all.where(role: :manager)
	end

	def show
		@admin = Admin.find(params[:id])
	end

	def destroy
		@admin = Admin.find(params[:id])
	  	if @admin.destroy
      		redirect_to startup_admins_path, notice: "Administrador excluido com sucesso."
    	else
      		render :index
    	end
	end


	private

	def params_admin
      	params.require(:admin).permit(:name, :email, :password, :password_confirmation, :cpf, :phone)
  	end
  
end
