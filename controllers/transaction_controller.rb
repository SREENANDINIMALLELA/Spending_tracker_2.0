require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/transaction' )
require_relative( '../models/customer' )

require_relative( '../dtos/transaction_dto' )
require_relative( '../dtos/customer_dto' )
require_relative( '../dtos/transaction_id_dto' )
require_relative( '../dtos/transaction_category_name_dto' )

require_relative( '../services/transaction_service' )

also_reload( '../models/*' )



get '/spending_tracker' do
  @transactions = TransactionService.getAllTransactions()
  @total_amount = TransactionService.getTotalAmount(@transactions)
  @customer = Customer.find(1)
  erb(:'transaction/index')
end



get '/spending_tracker/transactions' do
  @transactions = TransactionService.getAllTransactions()
  @categories = Category.all()
  @merchants = Merchant.all()
  erb(:'transaction/new')
end



post'/spending_tracker/transactions'do
transaction = Transaction.new(params)
transaction.save
redirect to '/spending_tracker/transactions'
end




get'/spending_tracker/transaction/:id/edit'do
@categories = Category.all()
@merchants = Merchant.all()
id = params[:id]
@transaction = Transaction.find(id)
erb(:"transaction/edit")
end

post'/spending_tracker/transaction/:id/edit'do
Transaction.update(params)
redirect to '/spending_tracker'
end


post '/spending_tracker/transaction/:id' do
  id = params[:id]
  Transaction.delete(id)
  erb(:"transaction/delete")
  redirect to '/spending_tracker/transactions'
end
