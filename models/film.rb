require("pg")
require_relative("../db/sql_runner")

class Film
  attr_accessor :title
  attr_reader :id

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]

  end

  def save()
    sql = "INSERT INTO films (title) VALUES ($1) RETURNING * "
    values = [@title]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def update()
    sql = "UPDATE films SET title = $1 WHERE id = $2"
    values = [@title, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end


end
