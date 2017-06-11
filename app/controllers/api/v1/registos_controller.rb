class Api::V1::RegistosController < ApplicationController
  respond_to :json
   skip_before_action :verify_authenticity_token


  def show

        @registo = Registo.find(params[:id])
        render json: @registo
      end

  def create
   registo=Registo.new(local_params) 
        # if the user is saved successfully than respond with json data and status code 201
   if registo.save 
    render json: registo, status: 201
   else
    render json: { errors: registo.errors}, status: 422
   end
  end

  private
  def local_params
   params.permit(:temperatura, :ruido,:humidade,:data,:local_id) 
  end

end
