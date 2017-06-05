  require 'mysql'

  class BaseDados

    def initialize(hostname,username,password,databasename)
        @con = Mysql.new(hostname, username,password, databasename)  
    end

    def close
        @con.close
    end

    def verificaClienteExiste(long,lat)
        
        rs = @con.query("SELECT count(*) from locais where local_longitude= " + long + 
          " and local_latitude= " + lat)
        total = rs.fetch_row 
        if(total[0]=='0') 
          return -1
        else
          return 1
        end
    end

    def insereCliente(long,lat)
      total = verificaClienteExiste(long,lat)
      if(total == -1) 
          rs = @con.query 'insert into locais (local_longitude,local_latitude)values ( ' + long  + ', ' + lat + ')' 
      end
      
    end

    def adicionaRegistos(t,n,h,timestamp,long,lat)

      rs = @con.query("SELECT id from locais where local_longitude= " + long + 
          " and local_latitude= " + lat)

      id = rs.fetch_row 
      
      rs = @con.query 'insert into registos (temperatura,ruido,humidade,data,local_id) values ( ' +   
            t + ", " + n + ", " + h + ", '#{timestamp}'" + ', ' + id[0] + ')' 

    end


  
end
