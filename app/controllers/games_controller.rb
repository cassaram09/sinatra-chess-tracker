class GamesController < ApplicationController
  configure do
    set :views, "app/views"
  end

  get '/users/:slug/games' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      erb :'/users/games/index'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/games/new' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      erb :'/users/games/new'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  post '/users/:slug/games' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @game = Game.find_by(id: params[:id])
      erb :'/users/games/show'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/games/:id' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @game = Game.find_by(id: params[:id])
      erb :'/users/games/show'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/games/:id/edit' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @game = Game.find_by(id: params[:id])
      erb :'/users/games/edit'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/games/:id/edit' do

  end

  patch '/users/:slug/games/:id' do
    #edit game
  end

  delete '/users/games/:id/delete' do
    #delete game
  end

end