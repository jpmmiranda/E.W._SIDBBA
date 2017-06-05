require 'socket'


class Cliente

  def initialize(longitude,latitude)
    @s = TCPSocket.open('localhost', 8000)
    @longitude = longitude #longitude do xdk
    @latitude = latitude #latitude do xdk
    enviaCoords
  end

  def enviaCoords
    @s.puts @longitude
    @s.puts @latitude
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
      puts time
			@s.puts readingTemp
      @s.puts readingNoise
      @s.puts readingHumidity
      @s.puts time
		end

  end

  
  def servidorClose
  	while true do
  		mensagem = @s.gets.chomp
  		if mensagem == "Fim"
  			@s.close
  			puts "Servidor desligou-se."
  			puts "Shutting down..."
  			exit
  		end
  	end
  end


end

#Criação de clientes
c=Cliente.new(ARGV[0],ARGV[1])

# Signal catching
def shut_down
  puts "\nShutting down..."
  sleep 1
end

# Trap ^C 
Signal.trap("INT") { 
  shut_down 
  c.enviaFim
  exit
}

# Trap `Kill `
Signal.trap("TERM") {
  shut_down
  c.enviaFim
  exit
}

threadDados = Thread.new{
	c.geraDados
}


threadMensagem = Thread.new{
	c.servidorClose
}

threadDados.join
threadMensagem.join


