class Api::V1::Registos_Controller < ApplicationController
  respond_to :json
   skip_before_action :verify_authenticity_token


  def show

    @registo = Registo.find(params[:id])
    render json: @registo
  end

  def create
   registo=Registo.new(local_params) 
   if registo.save 
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
