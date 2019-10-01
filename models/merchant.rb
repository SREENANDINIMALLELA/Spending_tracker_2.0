require_relative('../db/sql_runner')
require ('pry')
class Merchant
  attr_accessor :name
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end
  def save()

    sql = "INSERT INTO merchants
    (
      name
    )
    VALUES
    (
      $1
    )
    RETURNING id
    "
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i

  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run( sql )
    return results.map { |merchant| Merchant.new( merchant) }
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run( sql )
  end

  def self.find(id)
    sql = "DELETE FROM merchants
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end
  
end
