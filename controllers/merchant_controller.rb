require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/merchant' )
require_relative( '../dtos/groupby_merchant_dto' )
also_reload( '../models/*' )


get '/spending_tracker/merchant/new' do
  @merchants = Merchant.all()
  erb(:"merchant/new")
end


get'/spending_tracker/merchant/:name'do
@transactions = Transaction.find_transactions_by_merchant_name(params[:name])
erb(:"merchant/name")
end


get '/spending_tracker/merchant' do
  @transactions = Transaction.find_transactions_by_merchant()
  erb(:"merchant/index")
end


post'/spending_tracker/merchant'do
merchant = Merchant.new(params)
merchant.save
redirect to '/spending_tracker/merchant/new'
end

post '/spending_tracker/merchant/:id' do
  id = params[:id]
  @transaction = Transaction.check_tansaction_merchant_id(id)
  if (@transaction != 0 )
    erb(:"merchant/notdelete")
  elsif(@transaction  == 0)
    Merchant.find(id)
    redirect to '/spending_tracker/merchant/new'
  end

end
