require("pg")
require_relative("../db/sql_runner")

class Ticket
  attr_accessor :customer_id, :screening_id
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @customer_id = options["customer_id"]
    @screening_id = options["screening_id"]
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, screening_id) VALUES ($1, $2) RETURNING * "
    values = [@customer_id, @screening_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

end
