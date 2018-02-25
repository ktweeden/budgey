require_relative '../models/transaction'
require_relative '../models/tag'
require_relative '../models/merchant'
require_relative '../models/utils'


get '/add/transaction' do
  @merchants = Merchant.all
  @tags = Tag.all
  erb(:"transactions/add")
end

post '/add/transaction' do
  pennies = to_pennies(params['amount'])
  transaction_hash = {
    'amount' => pennies,
    'merchant_id' => params['merchant_id'],
    'tag_id' => params['tag_id']
  }
  transaction = Transaction.new(transaction_hash)
  transaction.save
  redirect '/'
end