require_relative('../models/merchant')
require_relative('../models/category')
require_relative('../models/transaction')
require_relative('../models/customer')
require('pry')
Transaction.delete_all
Merchant.delete_all
Category.delete_all
Customer.delete_all

catogory1 = Category.new({"name" => "groceries"})
catogory2 = Category.new({"name" => "fuel"})
catogory3 = Category.new({"name" => "entertainment"})
catogory1.save()
catogory2.save()
catogory3.save()

merchant1 = Merchant.new({"name" => "Tesco"})
merchant2 = Merchant.new({"name" => "Morrisons"})
merchant3 = Merchant.new({"name" => "Amazon"})
merchant1.save()
merchant2.save()
merchant3.save()
transaction1=Transaction.new({
  "merchant_id" => merchant1.id ,
  "category_id" => catogory1.id ,
  "amount" => 10 ,"transaction_date" => '2019-08-28'})

  transaction1.save()



  customer1 = Customer.new({
    "name" => "Sree" ,
    "wallet" =>500 ,
    "budget" =>250
    })

    customer1.save()
