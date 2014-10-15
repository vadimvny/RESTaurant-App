require 'bundler'
Bundler.require

require './connection'

# require_relative 'models/food'
# #require_relative 'models/party'
# require_relative 'models/order'

# class Party < ActiveRecord::Base
# 	has_many(:orders)
# 	has_many(:foods, :through => :orders)
# end


ROOT = Dir.pwd
Dir[ROOT+"/models/*.rb"].each { |file| require file }

#------------Foods-------------------

get '/' do 
	
	erb :index
end

get '/foods' do
	@foods = Food.all
	erb :'foods/index'
end

get '/foods/new' do

	erb :'foods/new'
end

post '/foods' do
	food = Food.create(params[:foods])
	if food.valid?
		redirect '/foods'
	else
		@errors = food.errors.full_messages
		erb :'foods/new'
	end
end

get '/foods/:id' do
	@food = Food.find(params[:id])
	erb :'foods/show'
end

get '/foods/:id/edit' do
	@food = Food.find(params[:id])
	erb :'foods/edit'
end

patch '/foods/:id' do
	food = Food.find(params[:id])
	food.update(params[:foods])
	redirect '/foods'
end

delete '/foods/:id' do
	@food = Food.destroy(params[:id])
	redirect '/foods'
end

#----------parties-----------------

get '/parties' do
	@parties = Party.all
	erb :'parties/index'
end

get '/parties/new' do

	erb :'parties/new'
end

post '/parties' do
	@party = Party.create(params[:parties])
	redirect '/parties'
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	erb :'parties/show'
end

get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'parties/edit'
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:parties])
	redirect '/parties'
end

delete '/parties/:id' do
	@party = Party.destroy(params[:id])
	redirect '/parties'
end

#----------order
get '/orders/' do
	@orders = Order.all
	erb :'orders/index'
end

get '/orders/new' do
	@order = Order.create(params[:id])
	@food = Food.all
	@parties = Party.all
	erb :'orders/new'
end

post '/orders/:id' do
	order = Order.create(params[:order])
	party = Party.find(params[:id])
	redirect '/orders/'
end
get '/orders/:id' do
	@order = Order.find(params[:id])
	erb :'orders/show'
end

get '/orders/:id/edit' do
	@order = Order.find(params[:id])
	erb :'orders/edit'
end

patch '/orders/:id' do
	order = Order.find(params[:id])
	order.update(params[:orders])
	redirect '/orders/'
end

delete '/orders/:id' do
	@order = Order.destroy(params[:id])
	redirect '/orders/'
end

get '/orders/receipt' do
	@order = Order.all
	erb :'orders/receipt'
end

patch '/parties/:id/checkout' do
	
	erb :receipt
end