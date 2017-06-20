class HistoricoController < ApplicationController
    before_action :index

	def index
	  @registo = Registo.find(params[:id])
	end
	
	def historicoTemperatura
        render json: @registo.valoresTemperatura
    end

    def historicoPressao
        render json: @registo.valoresPressao
    end

    def historicoLuminosidade
        render json: @registo.valoresLuminosidade
    end

    def historicoHumidade
        render json: @registo.valoresHumidade
    end
end
