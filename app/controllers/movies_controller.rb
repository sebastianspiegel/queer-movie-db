class MoviesController < ApplicationController

    get '/movies' do
        erb :'/movies/index'
    end

    get '/movies/new' do
        redirect_if_not_logged_in
        erb :'movies/new'
    end

    post '/movies' do
        if params[:title].blank? || Movie.find_by_title(params[:title])
            redirect '/movies/new'
        else
            @movie = Movie.create(params)
            @movie.user = current_user
            @movie.save
            redirect "/movies/#{@movie.id}"
        end
    end

    get '/movies/:id' do
        @movie = Movie.find(params[:id])
        erb :'/movies/show'
    end

    get '/movies/:id/edit' do
        redirect_if_not_logged_in
        @movie = Movie.find(params[:id])
        if @movie.user_id == session[:user_id]
            erb :'movies/edit'
        else
            redirect '/movies'
        end
    end

    patch '/movies/:id' do
        binding.pry 
    end

    delete '/movies/:id/delete' do
        redirect_if_not_logged_in
        movie = Movie.find(params[:id])
        movie.delete 
        redirect '/movies'
    end
end