require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "put_actual_thing_here"
    register Sinatra::Flash 
  end

  get "/" do
    @user = current_user 
    erb :'index'
  end

  helpers do

    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def allowed_to_edit
      @movie.user_id == session[:user_id] || admin_account
    end

    def admin_account
      @current_user.account_type == "admin"
    end

  end

  private 
  def redirect_if_not_logged_in
    if !logged_in?
      redirect '/login'
    end
  end

end
