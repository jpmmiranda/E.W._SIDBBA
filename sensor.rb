require 'httparty'


class Sensor

  def initialize(id,longitude,latitude)
    @id = id
    @longitude = longitude #longitude do xdk
    @latitude = latitude #latitude do xdk
    enviaCoords
  end

  def enviaCoords
    @urlstring_to_post = 'http://localhost:3000/api/v1/locais/?local_longitude='+@longitude+'&local_latitude='+@latitude
    @result = HTTParty.post(@urlstring_to_post.to_str)
    geraDados
  end

  def geraDados
  	temp = rand(50)
    lum = rand(400..700) 
    hum = rand(100)
    pres = rand(900..1100)
		while true do
			if(rand(2) == 1)
				temp += 1
        lum += 10
        hum += 1
        pres +=10
			else
        temp -= 1
        lum -= 10
        hum -= 1
        pres -=10	
      end
      time = Time.now.getutc
      @urlstring_to_post = 'http://localhost:3000/api/v1/registos/?temperatura='+temp.to_s+'&luminosidade=' + lum.to_s + '&humidade='+ hum.to_s  + '&pressao=' + pres.to_s + '&data=' + time.to_s + '&local_id=' + @id
      @result = HTTParty.post(@urlstring_to_post.to_str)
      
      sleep 1

		end

  end

end

#Criação de clientes
c=Sensor.new(ARGV[0],ARGV[1],ARGV[2])

# Signal catching
def shut_down
  puts "\nShutting down..."
  sleep 1
end

# Trap ^C 
Signal.trap("INT") { 
  shut_down 
  exit
}

# Trap `Kill `
Signal.trap("TERM") {
  shut_down
  exit
}

threadDados = Thread.new{
	c.geraDados
}

##threadDados.join


