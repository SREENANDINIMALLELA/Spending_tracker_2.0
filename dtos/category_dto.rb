require_relative('../db/sql_runner')
class CategoryDto
  attr_accessor :id ,:name
  def initialize(args)
    @id = args['id'].to_i
    @name = args['name']
  end
end
