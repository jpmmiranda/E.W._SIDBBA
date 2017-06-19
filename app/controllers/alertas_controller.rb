class AlertasController < ApplicationController
  
  def show
  end
	
  def index
    @c =current_user.id
	@sensores=Locai.all
  end
  
  def create
	#redirect_to '/inicial/index'
	@alerta = Alerta.new(alertas_params)
	@alerta.user_id = current_user.id
	if @alerta.save
		redirect_to '/inicial/index'
	else
		render '/alertas/index'
	end
  end
  
  private
  def alertas_params
    params.require(:alerta).permit(:sensor_id,0,:max_temp,:min_temp,:max_luminosidade,:min_luminosidade,:max_pressao,:min_pressao,:max_humidade,:min_humidade)
  end
  
end
