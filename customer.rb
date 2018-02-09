require_relative("./SQL_Runner")

class Customer

attr_reader :id
attr_accessor :name, :funds

def initialize ( options )
  @id = options['id'].to_i
  @name = options ['name']
  @funds = options ['funds']
end

def save()
    sql = "INSERT INTO customers
    (name, funds)
    VALUES ($1, $2)
    RETURNING id"
    values = [@name, @funds]
    customers = SqlRunner.run( sql, values ).first
    @id = customers['id'].to_i
end

def update()
  sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3 "
  values = [@name, @funds, @id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

def films()
      sql = "SELECT films.* FROM films
      INNER JOIN tickets ON tickets.filmid = films.id WHERE customerid = $1"
            values = [@id]
      films = SqlRunner.run(sql, values)
      return films.map { |film| Film.new(film) }
end

def buy_ticket(ticket)
   @funds -= ticket.price
end

end
