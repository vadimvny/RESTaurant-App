require 'bundler'
Bundler.require
require './connection'

enable :sessions
require './helpers/application_helpers.rb'

ROOT = Dir.pwd
Dir[ROOT+"/models/*.rb"].each { |file| require file }

#------------Foods-------------------

get '/' do 

	erb :index
end

get '/users/new' do

	erb :'users/new'
end

post '/users' do
	user = User.new(params[:user])
	user.password = params[:password]
	user.save!
	redirect '/'
end

get '/login' do
	erb  :'sessions/login'
	end

post '/sessions' do
	redirect '/' unless user = User.find_by(username: params[:username])
	if user.password == params[:password]
		session[:current_user] = user.id
		redirect '/'
	else
		redirect '/login'
	end
end

delete '/sessions' do
	session[:current_user] = nil
	redirect '/login'
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
	@order = Order.all
	erb :'parties/index'
end

get '/parties/new' do

	erb :'parties/new'
end

post '/parties/:party_id/orders' do
	
	Order.create({
		party_id: params[:party_id],
		food_id: params[:food_id]
	})
	binding.pry
	redirect "/parties/#{params[:party_id]}"
end

post '/parties' do
	party = Party.create(params[:parties])
	orders = Order.create(params[:orders])
	redirect '/parties'
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	erb :'parties/show'
end

get '/parties/:id/edit' do
	@party = Party.find(params[:id])
	erb :'parties/edit'
end

get 'parties/:id/orders' do
	@party = Party.find(params[:party_id])
	@orders = Party.find(params[:orders])
	erb :'orders/index'
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
get '/orders' do
	@orders = Order.all
	@party = Party.all 
	erb :'orders/index'
end

get '/orders/new' do
	@food = Food.all
	@order = Order.create(params[:id])
	#@party = Party.find(params[:id])
	erb :'orders/new'
end


get '/orders/:id' do
	@order = Order.find(params[:id])
	@party = @order.party
	#@food = Food.find_by(params[:id])
	# @party = Party.find(params[:id])
	# @food = Food.create(params[:id])
	erb :'orders/show'
end

get '/orders/:id/edit' do
	@order = Order.find(params[:id])
	erb :'orders/edit'
end

patch '/orders/:id' do
	order = Order.find(params[:id])
	order.update(params[:orders])
	redirect '/orders'
end

delete '/orders/:id' do
	@order = Order.destroy(params[:id])
	redirect '/orders'
end

get '/orders/receipt' do
	@order = Order.all
	erb :'orders/receipt'
end

patch '/parties/:id/checkout' do
	
	erb :receipt
end