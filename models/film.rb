require("pg")
require_relative("../db/sql_runner")

class Film
  attr_accessor :id
  attr_reader :title

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]

  end

  def save()
    sql = "INSERT INTO films (title) VALUES ($1) RETURNING * "
    values = [@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end
  


end
