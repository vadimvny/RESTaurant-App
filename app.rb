require 'bundler'
Bundler.require
require_relative 'models/food'
#require_relative 'models/party'
require_relative 'models/order'

class Party < ActiveRecord::Base
	has_many(:orders)
	has_many(:foods, :through => :orders)
end

ActiveRecord::Base.establish_connection({

	adapter: 'postgresql',
	database: 'restaurant_db'

	})
#------------Foods-------------------

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
