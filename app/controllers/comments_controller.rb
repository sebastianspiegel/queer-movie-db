class CommentsController < ApplicationController

    post '/comments' do
        redirect_if_not_logged_in
        @comment = Comment.new(params)
        if @comment.invalid?
            flash[:message] = "Must enter text to leave a comment."
            redirect "/movies/#{params[:movie_id]}"
        else
            @comment.user_id = session[:user_id] 
            @comment.save
            redirect "/movies/#{params[:movie_id]}"
        end
    end

    get '/comments/:id/edit' do
        redirect_if_not_logged_in
        @comment = Comment.find(params[:id])
        erb :'/comments/edit'
    end

    patch '/comments/:id' do
        redirect_if_not_logged_in
        comment = Comment.find(params[:id])
        if comment.user != current_user && !admin_account 
            flash[:message] = "You cannot edit this comment."
        else
            comment.update(content: (params[:content]))
        end
        redirect "/movies/#{comment.movie_id}"
    end

    delete '/comments/:id/delete' do
        redirect_if_not_logged_in
        comment = Comment.find(params[:id])
        if current_user.id != comment.user_id && !admin_account 
            flash[:message] = "You cannot delete that comment."
            redirect "/movies/#{comment.movie_id}"
        else
            comment.delete
            redirect "/movies/#{comment.movie_id}"
        end
    end

end