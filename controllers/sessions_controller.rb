class SessionsController < ApplicationController
  get '/login' do
    erb :'sessions/login'
  end

  post '/' do
    redirect '/' unless user = User.find_by(username: params[:username])
    if user.password == params[:password]
      session[:current_user] = user.id
      redirect '/'
    else
      redirect '/'
    end
  end

  delete '/' do
    session[:current_user] = nil
    redirect '/'
  end
end
