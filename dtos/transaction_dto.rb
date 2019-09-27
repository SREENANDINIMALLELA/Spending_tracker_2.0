require_relative('../db/sql_runner')
class TransactionDto
  attr_accessor :category_name ,:merchant_name ,:amount ,:transaction_date,:id
  def initialize(args)
    @id=args['id']
    @category_name = args['category_name']
    @merchant_name = args['merchant_name']
    @amount = args['amount'].to_f
    @transaction_date= args['transaction_date']
  end
end
