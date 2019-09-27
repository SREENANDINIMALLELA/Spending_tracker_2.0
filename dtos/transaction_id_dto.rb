require_relative('../db/sql_runner')
require ('date')
class TransactionidDto
  attr_accessor :merchant_id , :amount,:category_id,:transaction_date
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @category_id = options['category_id'].to_i
    @merchant_id = options['merchant_id'].to_i
    @amount= options['amount'].to_i
    @transaction_date = options['transaction_date']
  end
end
