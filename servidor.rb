  require 'socket'
  require 'mysql'
  require './baseDados'

  class Servidor

      def initialize(port)
          @server = TCPServer.open(port)  
          #my = Mysql.new(hostname, username, password, databasename)  
          @bd = BaseDados.new('localhost', 'root', 'ruiborges', 'sidbba_development') 
          @arraySocketIds = Array.new

      end

      def start
        loop {
          Thread.start(@server.accept) do |client|
            long = client.gets.chomp
            lat = client.gets.chomp
            @bd.insereCliente(long,lat)
            @arraySocketIds.push(client)

            while true do

                  leituraT = client.gets.chomp
                  leituraN = client.gets.chomp
                  leituraH = client.gets.chomp

                  timestamp = client.gets.chomp

                  @bd.adicionaRegistos(leituraT,leituraN,leituraH,timestamp,long,lat)          
              
            end

          end
        }
      end

      def close
        @bd.close
        @arraySocketIds.each{ |socket| socket.puts "Fim"}
        @server.close
      end

      
end

  

server = Servidor.new(8000)

# Signal catching
def shut_down
puts "\nShutting down server..."
end

# Trap ^C 
Signal.trap("INT") { 
shut_down
server.close
exit
}

# Trap `Kill `
Signal.trap("TERM") {
shut_down
server.close
exit
}

serverThread=Thread.new{
  server.start
}
system "clear"



serverThread.join
