require_relative("./SQL_Runner")

class Ticket

attr_reader :id, :price
attr_accessor :filmid, :customerid

def initialize ( options )
  @id = options['id'].to_i
  @filmid = options ['filmid']
  @customerid = options ['customerid']
  @price = options ['price']
end

def save()
    sql = "INSERT INTO tickets
    (filmid, customerid, price)
    VALUES ($1, $2, $3)
    RETURNING id"
    values = [@filmid, @customerid, @price]
    tickets = SqlRunner.run( sql, values ).first
    @id = tickets['id'].to_i
end

def update()
  sql = "UPDATE tickets SET (filmid, customerid) = ($1, $2) WHERE id = $3 "
  values = [@filmid, @customerid, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

end
