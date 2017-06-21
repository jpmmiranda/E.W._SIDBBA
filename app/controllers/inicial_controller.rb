class InicialController < ApplicationController
  respond_to :js, :html

	def index
		count=0
		user_id1 = current_user.id
		
		@leituras1=Registo.group('"local_id"')
		@leituras = Registo.group('"local_id"').having('data = MAX(data)')
		
		@leituras1.each do |leitura|
			Alerta.all.each do |alerta|
				if alerta.user_id==user_id1 && leitura.local_id==alerta.sensor_id
					if leitura.temperatura <= alerta.max_temp && leitura.temperatura >= alerta.min_temp
						if count==0
							flash[:success] = "Alerta Temperatura No Sensor #{leitura.local_id} --- "
							count=1
						else
							flash[:success] << "Alerta Temperatura No Sensor #{leitura.local_id} --- "
						end
					end
					if leitura.luminosidade <= alerta.max_luminosidade && leitura.luminosidade >= alerta.min_luminosidade
						if count==0
							flash[:success] = "alerta luminosidade No Sensor #{leitura.local_id} --- "
							count=1
						else
							flash[:success] << "alerta luminosidade No Sensor #{leitura.local_id} --- "
						end
					end
					if leitura.humidade <= alerta.max_humidade && leitura.humidade >= alerta.min_humidade
						if count==0
							flash[:success] = "alerta humidade No Sensor #{leitura.local_id} --- "
							count=1
						else
							flash[:success] << "alerta humidade No Sensor #{leitura.local_id} --- "
						end
					end
					if leitura.pressao <= alerta.max_pressao && leitura.pressao >= alerta.min_pressao
						if count==0
							flash[:success] = "alerta pressao No Sensor #{leitura.local_id} --- "
							count=1
						else
							flash[:success] << "alerta pressao No Sensor #{leitura.local_id} --- "
						end
					end
				end
			end
		end
	  	 @hash = Gmaps4rails.build_markers(Locai.all) do |record, marker|
	  	 getValores(record.id)
	     marker.lat record.local_latitude
	     marker.lng record.local_longitude
	     unless @va.blank?
	     marker.json({ :id => record.id,  infowindow: '<h5>'+'Ultimos Registos:'+'</h5>' +
	                '<p>Temperatura: '+@va[:temperatura].to_s+' ºC</p>' +
	                '<p>Luminosidade: '+@va[:luminosidade].to_s+' cd</p>' +
	                '<p>Pressão: '+@va[:pressao].to_s+' mb</p>' +
	                '<p>Humidade: '+@va[:humidade].to_s+' %</p>' +'<button class= btn btn-info onclick="verHistorico('+record.id.to_s+')">Ver histórico</button>' })  
	     end
 		end
	end

	def getValores(id)
		@va = Registo.getRegistos(id)
	end
	

end
