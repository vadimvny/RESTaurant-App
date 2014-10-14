require 'bundler'
Bundler.require
require_relative 'models/food'
require_relative 'models/order'
require_relative 'models/order'

ActiveRecord::Base.establish_connection({

	adapter: 'postgresql',
	database: 'restaurant_db'

	})

# class Food < ActiveRecord::Base
# 	has_many(:orders)
# 	has_many(:parties, :through => :orders)
# end 

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

redirect '/foods'
end

get '/foods/:id' do

	erb :'foods/show'
end

get '/foods/:id/edit' do
	
	erb :'foods/edit'
end