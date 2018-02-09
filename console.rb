require_relative( './customer')
require_relative( './film')
require_relative( './ticket')

require( 'pry-byebug' )

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

customer1 = Customer.new ({ 'name' => 'Elizabeth Gemmell', 'funds' => '10' })
customer1.save()
customer2 = Customer.new ({ 'name' => 'Joseph Gemmell', 'funds' => '12' })
customer2.save()

film1 = Film.new ({ 'title' => 'Paddington', 'price' => '3'})
film1.save()

ticket1 = Ticket.new ({'filmid' => film1.id, 'customerid' => customer1.id, 'price' => 2})
ticket1.save()
ticket2 = Ticket.new ({'filmid' => film1.id, 'customerid' => customer2.id, 'price' => 2})
ticket2.save()

binding.pry
nil
