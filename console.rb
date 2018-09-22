require ("pry")
require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/screening")
require_relative("./models/ticket")

Ticket.delete_all()
Screening.delete_all()
Film.delete_all()
Customer.delete_all()

customer1 = Customer.new({
  'name' => 'Kaiser Soze',
  'funds' => 100
  })
customer1.save()


customer2 = Customer.new({
  'name' => 'Darth Vader',
  'funds' => 20
  })
customer2.save()


customer3 = Customer.new({
  'name' => 'Kylo Ren',
  'funds' => 20
  })
customer3.save()


customer4 = Customer.new({
  'name' => 'The Doctor',
  'funds' => 1000
  })
customer4.save()

# customer4.delete() - this causes an FK violation error. On Delete Cascade not working??




customer5 = Customer.new({
  'name' => 'Lorraine Baines McFly',
  'funds' => 15
  })
customer5.save()


customer6 = Customer.new({
  'name' => 'HG Wells',
  'funds' => 50
  })
customer6.save()


customer7 = Customer.new({
  'name' => 'Romeo Montague',
  'funds' => 50
  })
customer7.save()


customer8 = Customer.new({
  'name' => 'Juliet Capulet',
  'funds' => 12
  })
customer8.save()


customer9 = Customer.new({
  'name' => 'Susan Bones',
  'funds' => 12
  })
customer9.save()

customer9.name = "Madam Bones"
customer9.update()


customer10 = Customer.new({
  'name' => 'Griselda Marchbanks',
  'funds' => 40
  })
customer10.save()

customer11 = Customer.new({
  'name' => 'Pure Rando',
  'funds' => 0
  })
  customer11.save()

  customer11.delete()




film1 = Film.new({
  'title' => 'The Godfather Part 2'
  })
film1.save()


film2 = Film.new({
  'title' => 'Back To The Future'
  })
film2.save()

film2.title = "Back to The Future"
film2.update

film3 = Film.new({
  'title' => 'Love Actually'
  })
film3.save()


film4 = Film.new({
  'title' => 'Harry Potter and The Order of The Phoenix'
  })
film4.save()



screening1 = Screening.new({
  'film_id' => film1.id,
  'start_time' => '15:00',
  'price' => 8,
  })
screening1.save()


screening2 = Screening.new({
  'film_id' => film1.id,
  'start_time' => '20:00',
  'price' => 12,
  })
screening2.save()


screening3 = Screening.new({
  'film_id' => film2.id,
  'start_time' => '15:00',
  'price' => 8,
  })
screening3.save()

screening3.price = 5
screening3.update()


screening4 = Screening.new({
  'film_id' => film2.id,
  'start_time' => '20:00',
  'price' => 12,
  })
screening4.save()


screening5 = Screening.new({
  'film_id' => film3.id,
  'start_time' => '15:00',
  'price' => 8,
  })
screening5.save()


screening6 = Screening.new({
  'film_id' => film3.id,
  'start_time' => '20:00',
  'price' => 12,
  })
screening6.save()

screening7 = Screening.new({
  'film_id' => film4.id,
  'start_time' => '15:00',
  'price' => 8,
  })
screening7.save()


screening8 = Screening.new({
  'film_id' => film4.id,
  'start_time' => '20:00',
  'price' => 12,
  })
screening8.save()





ticket1 = Ticket.new({
  'customer_id' => customer3.id,
  'screening_id' => screening6.id
  })
ticket1.save()


ticket2 = Ticket.new({
  'customer_id' => customer5.id,
  'screening_id' => screening6.id
  })
ticket2.save()


ticket3 = Ticket.new({
  'customer_id' => customer8.id,
  'screening_id' => screening6.id
  })
ticket3.save()


ticket4 = Ticket.new({
  'customer_id' => customer10.id,
  'screening_id' => screening6.id
  })
ticket4.save()

ticket4.customer_id = customer9.id
ticket4.update


ticket5 = Ticket.new({
  'customer_id' => customer1.id,
  'screening_id' => screening1.id
  })
ticket5.save()


ticket6 = Ticket.new({
  'customer_id' => customer2.id,
  'screening_id' => screening1.id
  })
ticket6.save()


ticket7 = Ticket.new({
  'customer_id' => customer3.id,
  'screening_id' => screening1.id
  })
ticket7.save()


ticket8 = Ticket.new({
  'customer_id' => customer9.id,
  'screening_id' => screening8.id
  })
ticket8.save()


ticket9 = Ticket.new({
  'customer_id' => customer10.id,
  'screening_id' => screening8.id
  })
ticket9.save()


ticket10 = Ticket.new({
  'customer_id' => customer2.id,
  'screening_id' => screening8.id
  })
ticket10.save()


ticket11 = Ticket.new({
  'customer_id' => customer4.id,
  'screening_id' => screening4.id
  })
ticket11.save()


ticket12 = Ticket.new({
  'customer_id' => customer6.id,
  'screening_id' => screening4.id
  })
ticket12.save()


ticket13 = Ticket.new({
  'customer_id' => customer5.id,
  'screening_id' => screening4.id
  })
ticket13.save()


ticket14 = Ticket.new({
  'customer_id' => customer7.id,
  'screening_id' => screening1.id
  })
ticket14.save()

# ticket14.delete() - this works


binding.pry
nil
