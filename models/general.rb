require_relative("../db/sql_runner.rb")

class General

  attr_reader(:id, :name, :reputation)

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @reputation = options["reputation"]
  end

  # instance variables
    def save()
      sql = "INSERT INTO generals (
            name, reputation)
            VALUES ($1, $2)
            RETURNING id;"
      values = [@name, @reputation]
      results = SqlRunner.run(sql, values)
      @id = results.first()["id"].to_i()
    end


  # class variables
    def self.delete_all()
      sql = "DELETE FROM generals;"
      SqlRunner.run(sql)
    end

end
