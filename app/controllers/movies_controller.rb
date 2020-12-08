class MoviesController < ApplicationController

    get '/movies' do
        erb :'/movies/index'
    end

    get '/movies/new' do
        redirect_if_not_logged_in
        erb :'movies/new'
    end

    post '/movies' do
        redirect_if_not_logged_in
        @movie = Movie.new(params)
        if @movie.invalid?
            flash[:message] = "That movie already exists in this database."
            redirect '/movies/new'
        else
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
        if @movie.user_id == session[:user_id] || User.find_by_username("admin").id == session[:user_id]
            erb :'movies/edit'
        else
            flash[:message] = "You cannot edit that movie."
            redirect '/movies'
        end
    end

    patch '/movies/:id' do
        redirect_if_not_logged_in
        movie = Movie.find(params[:id])
        if current_user.id != movie.user_id && current_user.id != User.find_by_username("admin").id 
            flash[:message] = "You cannot edit that movie."
            redirect '/movies'
        elsif params.values.any? &:empty?
            flash[:message] = "Cannot have empty fields."
            redirect "movies/#{movie.id}/edit"
        else
            params.delete("_method")
            movie.update(params)
            redirect "/movies/#{movie.id}"
        end
    end

    delete '/movies/:id/delete' do
        redirect_if_not_logged_in
        movie = Movie.find(params[:id])
        if current_user.id != movie.user_id 
            flash[:message] = "You cannot edit that movie."
            redirect '/movies'
        else
            movie.delete 
            redirect '/movies'
        end
    end
end