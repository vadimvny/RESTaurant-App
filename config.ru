require 'bundler'
Bundler.require

Dir.glob('./{helpers, controllers, models}/*.rb').each do |file|
  require file
    puts "required #{file}"
  end

map('/users'){run UsersController}
map('/sessions'){run SessionsController}
map('/'){run ApplicationController}

   
