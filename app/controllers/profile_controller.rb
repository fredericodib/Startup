class ProfileController < ApplicationController
	layout "profile"
  before_action :authenticate_admin!

	def show
    @admin = current_admin
	end

	def edit_data
		@admin = current_admin
  end

  def edit_password
  	@admin = current_admin
  end

	def update
		@admin = Admin.find(params[:id])
  	if @admin.update(params_admin)
    	redirect_to profile_datas_path, notice: 'Conta atualizada com sucesso'
  	else
    	redirect_back(fallback_location: root_path, alert: 'Não foi possível alterar os dados')
  	end
	end



	private

	def params_admin
        params.require(:admin).permit(:name, :email, :phone, :password, :password_confirmation, :cpf)
    end
end
