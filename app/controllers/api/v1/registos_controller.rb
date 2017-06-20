class Api::V1::RegistosController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token
  add_flash_types :success

  def show

    @registo = Registo.find(params[:id])
    render json: @registo
  end

  def create
   registo=Registo.new(local_params)
   #@id = current_user.id
   #Alerta.where(user_id: current_user.id, sensor_id: registo.local_id).destroy_all
   #alerta=Alerta.find_by(user_id: current_user.id, sensor_id: registo.local_id)
   if registo.save
		flash[:success] = "Alerta fds"
		#if registo.temperatura <= alerta.max_temp && registo.temperatura >= alerta.min_temp
			#flash[:error] = "Your book was not found"
		#end
		render json: registo, status: 201
   else
    render json: { errors: registo.errors}, status: 422
   end
  end

  private
  def local_params
   params.permit(:temperatura, :luminosidade,:humidade,:pressao,:data,:local_id) 
  end

end
