require 'httparty'


class Sensor

  def initialize(id,longitude,latitude)
    @id = id
    @longitude = longitude #longitude do xdk
    @latitude = latitude #latitude do xdk
    enviaCoords
  end

  def enviaCoords
    @urlstring_to_post = 'http://localhost:3000/api/v1/locais/?local_latitude='+@latitude+'&local_longitude='+@longitude
    @result = HTTParty.post(@urlstring_to_post.to_str)
    geraDados
  end

  def geraDados
  	readingTemp = rand(30)
    readingNoise = rand(300) 
    readingHumidity = rand(100)

		while true do
			sleep 1
			if(rand(2) == 1)
				readingTemp += 1
        readingNoise += 50
        readingHumidity += 20
			else
        readingTemp -= 1
        readingNoise -= 50
        readingHumidity -= 20	
      end
      time = Time.now.getutc
      @urlstring_to_post = 'http://localhost:3000/api/v1/registos/?temperatura='+readingTemp.to_s + 
        '&ruido=' + readingNoise.to_s + '&humidade='+ readingHumidity.to_s + '&data=' + time.to_s + '&local_id=' + @id
      @result = HTTParty.post(@urlstring_to_post.to_str)

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


