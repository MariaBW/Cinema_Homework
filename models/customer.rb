require("pg")
require_relative("../db/sql_runner")

class Customer
  attr_accessor :name, :funds
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end


  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING *"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def show_screenings()
    sql = "SELECT screenings.* FROM screenings INNER JOIN tickets ON screenings.id = tickets.screening_id WHERE customer_id = $1"
    values = [@id]
    screenings = SqlRunner.run(sql, values)
    return screenings.map { |screening| Screening.new(screening) }
  end

  def buy_ticket(screening)
    #create ticket object for that customer and screening
    ticket = Ticket.new({ 'customer_id' => @id, 'screening_id' => screening.id})
    ticket.save()

    #decrease customer funds by price of screening.
    @funds -= screening.price
  end

  def show_films()
    #call the screenings function
    screenings_array = self.show_screenings()
    #for each film_id in the list of screenings, show the film object
    for screening in screenings_array do Film.find_by_id(screening["film_id"])#this for loop throws an error to do with the data passed in to Film.find_by_id().
    end
  end



  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end




end
