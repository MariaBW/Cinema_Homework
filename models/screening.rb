require("pg")
require_relative("../db/sql_runner")

class Screening
  attr_accessor :film_id, :start_time, :price, :capacity
  attr_reader :id


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @start_time = options["start_time"]
    @price = options["price"]
    @capacity = options["capacity"]
  end

  def save()
    sql = "INSERT INTO screenings (film_id, start_time, price, capacity) VALUES ($1, $2, $3, $4) RETURNING * "
    values = [@film_id, @start_time, @price, @capacity]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE screenings SET (film_id, start_time, price, capacity) = ($1, $2, $3, $4) WHERE id = $5"
    values = [@film_id, @start_time, @price, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def show_customers()
    sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id WHERE screening_id = $1 "
    values = [@id]
    customers = SqlRunner.run(sql, values)
    return customers.map { |customer| Customer.new(customer)}
  end

  def count_customers()
    return self.show_customers.count()
  end


  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


end
