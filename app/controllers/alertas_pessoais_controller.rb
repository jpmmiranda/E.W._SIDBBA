class AlertasPessoaisController < ApplicationController


def index

	@alertas=Alerta.where(user_id: current_user.id)
	@alertas.each do |alerta|
	@local=Locai.all
		
	end
end



end
