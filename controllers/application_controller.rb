class ApplicationController < Sinatra::Base

  helpers Sinatra::AuthenticationHelper

  enable :sessions
  enable :method_override

  require File.expand_path(File.dirname(__FILE__) + '/../connection')

  set :public_folder, File.expand_path(File.dirname(__FILE__) + '/../public')
  set :views, File.expand_path(File.dirname(__FILE__) + '/../views')

  get '/' do
    if current_user
      erb :authenticated
    else
      erb :not_authenticated
    end
    erb :index
  end


end
