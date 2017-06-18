class Registo < ActiveRecord::Base


	def self.getRegistos(id)
		
		valores=Registo.where(local_id: id).order('data DESC').first
		valores
	end

	def valoresTemperatura
		temp=Registo.group("day(data)").group("month(data)").average(:temperatura)
		temp
	end

	def valoresRuido
		r=Registo.group("day(data)").group("month(data)").average(:ruido)
		r
	end

	def valoresHumidade
		h=Registo.group("day(data)").group("month(data)").average(:humidade)
		h
	end
  
end
