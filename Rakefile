require 'bundler'
Bundler.require 

require 'sinatra/activerecord/rake'

require_relative 'connection.rb'

namespace :db do
	desc "Create restaurant_db database"
	task :create_db do
		conn = PG::Connection.open()
		conn.exec('CREATE DATABASE restaurant_db')
		conn.close
	end
	desc "Drop restaurant_db database"
	task :drop_db do
		conn = PG::Connection.open()
		conn.exec('DROP DATABASE restaurant_db')
		conn.close	
	end
	desc "Generate Junk Data"
	task :junk_data do

	require_relative 'connection'
    require_relative 'models/food'
    require_relative 'models/party'
    require_relative 'models/order'

    Food.create({name:'Pizza', price:'1000', description:'Italian'})
    Food.create({name:'Burger', price:'1050',description:'American'})
    Food.create({name:'Water', price:'500', description:'Polish'})

    Party.create({table_number: 4,  num_guests: 3})
    Party.create({table_number: 9,  num_guests: 2})
    Party.create({table_number: 12, num_guests: 4})
    Party.create({table_number: 13, num_guests: 7})
    Party.create({table_number: 6,  num_guests: 2})
    Party.create({table_number: 11, num_guests: 3})
    Party.create({table_number: 18, num_guests: 1})
	
    parties = Party.all
    foods = Food.all

    parties.each do |party|
      party.num_guests.times do
        Order.create({party: party, food: foods.sample}) if [true, false].sample
      end
    end

	end
end