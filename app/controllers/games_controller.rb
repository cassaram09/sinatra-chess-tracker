class GamesController < ApplicationController
  configure do
    set :views, "app/views"
  end

  get '/users/:slug/workouts' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      erb :'/users/workouts/index'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/workouts/new' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      erb :'/users/workouts/new'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  post '/users/:slug/workouts' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @workout = Workout.find_by(id: params[:id])
      erb :'/users/workouts/show'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/workouts/:id' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @workout = Workout.find_by(id: params[:id])
      erb :'/users/workouts/show'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/workouts/:id/edit' do
    @user = User.find_by_slug(params[:slug])
    @current = Helpers.current_user(session)
    if @current.id = @user.id
      @workout = Workout.find_by(id: params[:id])
      erb :'/users/workouts/edit'
    else
      redirect "/users/#{@current.slug}"
    end
  end

  get '/users/:slug/workouts/:id/edit' do

  end

  patch '/users/:slug/workouts/:id' do
    #edit workout
  end

  delete '/users/workouts/:id/delete' do
    #delete workout
  end

end