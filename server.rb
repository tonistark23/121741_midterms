require 'sinatra'
require './expense.rb'

expenses = []

get '/' do
	@expenses = expenses
  erb :index
end

get '/new' do
  erb :new
end

get '/show/:id' do
	@expenses = expenses
	erb :show
end

post '/save' do
	if expenses.empty? == true
		some_id = 0
	else
		some_id = some_id+1
	end
  expense = Expense.new(some_id, params[:item], params[:amount].to_f)
  expenses << expense
  @expenses = expenses
  erb :index
end
