require 'sinatra/activerecord'
require 'pg'

    # As an employee, I want to be able to add new food items... so the menu can change
    # As an employee, I want to be able to edit previously added food items... so I can update descriptions
    # As an employee, I want to be able to delete previously added food items... so I can remove bad food
    # As an employee, I want to be able to add food items to a party as they order them... so I can keep track of a party's orders
    # As an employee, I want to be able to create a receipt ... so I can print it

conn = PG::Connection.open()
conn.exec('CREATE DATABASE restaurant_db;')
conn.close

conn = PG::Connection.open(dbname: 'restaurant_db' )
conn.exec('CREATE TABLE foods (id SERIAL PRIMARY KEY, name VARCHAR(255), description VARCHAR(255), price integer);')
conn.exec('CREATE TABLE parties (id SERIAL PRIMARY KEY, size integer, reservation_time integer);')
conn.exec('CREATE TABLE orders (id SERIAL PRIMARY KEY, food_id VARCHAR(255), parties_id VARCHAR(255));')
conn.close


ActiveRecord::Base.establish_connection({

	adapter: 'postgresql',
	database: 'restaurant_db'

	})