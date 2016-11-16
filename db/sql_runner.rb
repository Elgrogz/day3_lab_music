require('pg')

class SqlRunner

  def self.run( sql )
    begin
      db = PG.connect ( { dbname: 'music' , host:'localhost' } )
      resutl = db.exec( sql )
    ensure
      db.close
    end
    return result
  end
  
end