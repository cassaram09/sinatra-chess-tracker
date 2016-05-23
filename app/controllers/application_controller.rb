require 'sinatra/base'

class ApplicationController < Sinatra::Base
  use Rack::Flash

  configure do
    set :public_folder, "public"
    set :views, "app/views"
    enable :sessions
    set :session_secret, "powerlifting4days"
  end

  get '/' do
    @user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session) 
      redirect "/users/#{@user.slug}"
    else 
      erb :index
    end
  end

  get '/login' do
    erb :login
  end

  post '/login' do
    if !params.has_value?("")
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:id] = @user.id
        @session = session
        flash[:message] = "Welcome, #{@user.name}!"
        redirect "/users/#{@user.slug}"
      else
        flash[:message] = "Incorrect username or password."
        redirect '/login'
      end
    else
      flash[:message] = "Error: Please fill out all fields."
      redirect '/login'
    end
  end

  get '/register' do
    @user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session) 
      redirect "/users/#{@user.slug}"
    else 
      erb :register
    end 
  end

  post '/register' do
    if !params.has_value?("")
      if User.find_by(email: params[:email])
        flash[:message] = "That email is already associated with another account."
        redirect '/register'
      end
      @user = User.new(params)
      if @user.save
        @user.save
        session[:id] = @user.id
        @session = session
        redirect "/users/#{@user.slug}"
      else
        flash[:message] = "There was an error. Please try again."
        redirect '/register'
      end
    else
      flash[:message] = "Please fill out all fields."
      redirect '/register'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/users' do
    @user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session) 
      redirect "/users/#{@user.slug}"
    else 
      redirect '/'
    end 
  end

  get '/users/:slug' do
    @user = Helpers.current_user(session)
    if Helpers.is_logged_in?(session) 
      if @user.slug == params[:slug]
        erb :'/users/show'
      else
        redirect "/users/#{@user.slug}"
      end
    else 
      redirect "/login"
    end
  end

end