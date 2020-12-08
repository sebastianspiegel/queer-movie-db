class UsersController < ApplicationController

    get '/login' do
        if logged_in?
            redirect '/'
        else
            erb :"/users/login"
        end
    end

    get '/signup' do
        if session[:user_id]
            redirect '/'
        else
            erb :"/users/signup"
        end
    end

    post '/login' do
        user = User.find_by_username(params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect "/users/#{user.slug}"
        else
            redirect '/login'
        end
    end

    post '/signup' do
        #is user savable? 
        user = User.new(params)
        #user.password.blank? || user.username.blank? || User.find_by_username(params[:username])
        if user.invalid?
            redirect '/signup'
        else
            user.save 
            session[:user_id] = user.id
            redirect '/'
        end
    end

    post '/logout' do
        if logged_in?
            session.destroy
            redirect '/login'
        else
            redirect '/'
        end
    end

    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :"/users/show"
    end

end