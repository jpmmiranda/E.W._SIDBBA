class Api::V1::LocaisController < ApplicationController
  respond_to :json
   skip_before_action :verify_authenticity_token


  def show

    @album = Locai.find(params[:id])
    render json: @album
  end

  def create
   local=Locai.new(local_params) 
   if local.save 
    render json: local, status: 201
   else
    render json: { errors: local.errors}, status: 422
   end
  end

  private
  def local_params
   params.permit(:local_longitude, :local_latitude) 
  end

end
