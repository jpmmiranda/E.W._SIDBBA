class HistoricoController < ApplicationController

	def index
	  @registo = Registo.all
	end
	 
end
