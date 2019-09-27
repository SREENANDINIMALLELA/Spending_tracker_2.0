require_relative('../db/sql_runner')
class TransactionCategoryNameDto
  attr_accessor :merchant_name ,:amount ,:transaction_date
  def initialize(args)
    @merchant_name = args['merchant_name']
    @amount = args['amount'].to_f
    @transaction_date = args['transaction_date']
  end
end
