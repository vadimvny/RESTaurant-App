require 'bundler'
Bundler.require
require_relative 'models/food'
require_relative 'models/order'
require_relative 'models/order'

ActiveRecord::Base.establish_connection({

	adapter: 'postgresql',
	database: 'restaurant_db'

	})


get '/' do 
	redirect '/foods'
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
	redirect '/foods'
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