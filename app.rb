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
	food = params[:food]
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
	authenticate!
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
	authenticate!
	@table_number = params[:table_number]
	erb :'parties/new'
end

post '/parties' do
 Party.create(params[:parties])
	redirect '/parties'
end

get '/parties/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	erb :'parties/show'
end

get '/parties/:id/edit' do
	authenticate!
	@party = Party.find(params[:id])
	erb :'parties/edit'
end

patch '/parties/:id' do
	party = Party.find(params[:id])
	party.update(params[:party])
	redirect '/parties'
end

delete '/parties/:id' do
	@party = Party.destroy(params[:id])
	redirect '/parties'
end


#----------order
post '/parties/:id' do
	@party = Party.find(params[:id])
	@foods = Food.all
	order = Order.create(params[:order])
end

get '/orders/:id/edit' do
	authenticate!
	@foods = Food.all
	@order = Order.find(params[:id])
	erb :"orders/edit"
end

patch '/orders/:id' do
	order = Order.find(params[:id])
	order.update(params[:order])
	redirect "/parties/#{order.party.id}"
end

delete '/orders/:id' do
	order = Order.find(params[:id])
	Order.destroy(params[:id])
	redirect "/parties/#{order.party.id}"
end

get '/parties/:id/receipt' do
	@party = Party.find(params[:id])
	erb :"parties/receipt"
end