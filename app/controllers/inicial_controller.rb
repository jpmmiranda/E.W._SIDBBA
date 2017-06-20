class InicialController < ApplicationController
  respond_to :js, :html

	def index
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
