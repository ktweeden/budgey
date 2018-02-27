require_relative '../models/transaction'
require_relative '../models/tag'
require_relative '../models/merchant'
require_relative '../models/utils'
require_relative '../models/budget'

get '/analytics/[:month]/[:year]' do
  @transactions = Transaction.by_month(params['month'], params['year'])
  @month = "#{params['month']}, #{params['year']}"
  erb(:"analytics/month")
end

get '/analytics/budgets' do
  @main_budget = Budget.main_budget.info
  @tag_budgets = Budget.all_tag_budgets.map {|budget| budget.info}
  erb(:"analytics/budgets")
end
