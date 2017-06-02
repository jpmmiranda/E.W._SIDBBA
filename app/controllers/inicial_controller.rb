class InicialController < ApplicationController

  def getUtilizador

  	utilizador = current_user
  end
helper_method :getUtilizador


end
