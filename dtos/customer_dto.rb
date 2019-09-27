require_relative('../db/sql_runner')
class CustomerDto
  attr_accessor :wallet ,:budget
  @wallet = 0
  @budget = 0
  def initialize(args)
     @wallet = args['wallet'].to_i
     @budget = args['budget'].to_i

  end

end
