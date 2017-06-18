class HistoricoController < ApplicationController
    before_action :index

	def index
	  @registo = Registo.find(params[:id])
	end
	
	def historicoTemperatura
        render json: @registo.valoresTemperatura
    end

    def historicoRuido
        render json: @registo.valoresRuido
    end

    def historicoHumidade
        render json: @registo.valoresHumidade
    end
end
