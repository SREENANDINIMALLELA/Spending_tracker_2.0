require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/category_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/transaction_controller')
require_relative('controllers/customer_controller')

get '/' do
@customer = Customer.find(1)
  erb( :index )
end
