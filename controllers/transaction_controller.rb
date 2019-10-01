require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative( '../models/transaction' )
# require_relative( 'models/merchant' )
# require_relative( 'models/category' )
require_relative( '../models/customer' )
require_relative( '../dtos/transaction_dto' )
# require_relative( 'dtos/groupby_category_dto' )
# require_relative( 'dtos/groupby_merchant_dto' )
# require_relative( 'dtos/category_dto' )
require_relative( '../dtos/customer_dto' )
require_relative( '../dtos/transaction_id_dto' )
require_relative( '../services/transaction_service' )
require_relative( '../dtos/transaction_category_name_dto' )
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


#
# get '/spending_tracker/category' do
#   @transactions = Transaction.find_transactions_by_category()
#   erb(:'category/show_by_category')
# end
#
#
#
# get'/spending_tracker/category/new'do
# @categories = Category.all()
# erb(:"category/new")
# end
#
#
# post'/spending_tracker/category'do
# category = Category.new(params)
# category.save
# redirect to '/spending_tracker/transactions'
# end
#
#
# get'/spending_tracker/category/:name'do
# @transactions = Transaction.find_transactions_by_category_name(params[:name])
# @transactions
# erb(:"category/name")
# end
#

#
# get '/spending_tracker/merchant/new' do
#   @merchants = Merchant.all()
#   erb(:"merchant/new")
# end
# get'/spending_tracker/merchant/:name'do
# @transactions = Transaction.find_transactions_by_merchant_name(params[:name])
# erb(:"merchant/name")
# end
# get '/spending_tracker/merchant' do
#   @transactions = Transaction.find_transactions_by_merchant()
#   erb(:"merchant/show_by_merchant")
# end
#
#
#
# post'/spending_tracker/merchant'do
# merchant = Merchant.new(params)
# merchant.save
# redirect to '/spending_tracker/transactions'
# end
#



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

# post '/spending_tracker/category/:id' do
#   id = params[:id]
#   @transaction = Transaction.check_tansaction_id(id)
#   @transaction
#   if (@transaction != 0 )
#     erb(:"category/notdelete")
#   elsif(@transaction  == 0)
#     Category.delete_by_id(id)
#     erb(:"category/delete")
#   end
# end
# post '/spending_tracker/merchant/:id' do
#   id = params[:id]
#   @transaction = Transaction.check_tansaction_merchant_id(id)
#   if (@transaction != 0 )
#     erb(:"merchant/notdelete")
#   elsif(@transaction  == 0)
#     Category.delete_by_id(id)
#     erb(:"merchant/delete")
#   end
# end


post '/spending_tracker/transaction/:id' do
  id = params[:id]
  Transaction.delete(id)
  erb(:"transaction/delete")
  redirect to '/spending_tracker/transactions'
end
