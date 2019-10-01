require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/customer' )
also_reload( '../models/*' )

get '/home' do
  @customer = Customer.find(1)
  erb(:'category/index')
end
