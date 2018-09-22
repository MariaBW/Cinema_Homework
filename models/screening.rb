require("pg")
require_relative("../db/sql_runner")

class Screening
  attr_accessor :film_id, :start_time, :price
  attr_reader :id


  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @start_time = options["start_time"]
    @price = options["price"]
  end

  def save()
    sql = "INSERT INTO screenings (film_id, start_time, price) VALUES ($1, $2, $3) RETURNING * "
    values = [@film_id, @start_time, @price]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE screenings SET (film_id, start_time, price) = ($1, $2, $3) WHERE id = $4"
    values = [@film_id, @start_time, @price, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end


end
