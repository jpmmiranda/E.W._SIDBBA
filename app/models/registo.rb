class Registo < ActiveRecord::Base


	def self.getRegistos(id)
		valores=Registo.where(local_id: id).order('data DESC').first
		valores
	end

	def valoresTemperatura
		temp=Registo.group("day(data)").group("month(data)").average(:temperatura)
		temp
	end

	def valoresLuminosidade
		l=Registo.group("day(data)").group("month(data)").average(:luminosidade)
		l
	end

	def valoresPressao
		p=Registo.group("day(data)").group("month(data)").average(:pressao)
		p
	end

	def valoresHumidade
		h=Registo.group("day(data)").group("month(data)").average(:humidade)
		h
	end
  
end
