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
            flash[:message] = "Invalid login. Try again."
            redirect '/login'
        end
    end

    post '/signup' do
        #is user savable? 
        user = User.new(params)
        #user.password.blank? || user.username.blank? || User.find_by_username(params[:username])
        if user.invalid?
            flash[:message] = "Invalid signup. Username or password cannot be blank. Username must be unique."
            redirect '/signup'
        else
            user.account_type = "user"
            user.save 
            session[:user_id] = user.id
            redirect '/'
        end
    end

    post '/logout' do
        if logged_in?
            session.destroy
            flash[:message] = "You are now logged out!"
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