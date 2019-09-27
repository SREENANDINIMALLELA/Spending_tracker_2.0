require_relative('../db/sql_runner')
class GroupByCategoryDto
  attr_accessor :category_name ,:amount
  def initialize(args)
    @category_name = args['category_name']
    @amount = args['amount'].to_f
  end
end
