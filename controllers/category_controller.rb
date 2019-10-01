require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/category' )
require_relative( '../dtos/groupby_category_dto' )
require_relative( '../dtos/category_dto' )
also_reload( '../models/*' )


get'/spending_tracker/category/new'do
@categories = Category.all()
erb(:"category/new")
end


get '/spending_tracker/category' do
  @transactions = Transaction.find_transactions_by_category()
  erb(:'category/index')
end


post'/spending_tracker/category'do
category = Category.new(params)
category.save
redirect to '/spending_tracker/category/new'
end


get'/spending_tracker/category/:name'do
@transactions = Transaction.find_transactions_by_category_name(params[:name])
@transactions
erb(:"category/name")
end

post '/spending_tracker/category/:id' do
  id = params[:id]
  @transaction = Transaction.check_tansaction_id(id)
  @transaction
  if (@transaction != 0 )
    erb(:"category/notdelete")
  elsif(@transaction  == 0)
    Category.delete_by_id(id)
    redirect to '/spending_tracker/category/new'
  end
end
