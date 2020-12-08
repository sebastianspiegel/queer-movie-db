class CommentsController < ApplicationController

    post '/comments' do
        redirect_if_not_logged_in
        @comment = Comment.new(params)
        if @comment.invalid?
            flash[:message] = "Must enter text to leave a comment."
            redirect "/movies/#{params[:movie_id]}"
        else
            @comment.save
            redirect "/movies/#{params[:movie_id]}"
        end
    end

    post '/comments/:id' do
        binding.pry
    end

    delete '/comments/:id/delete' do
        redirect_if_not_logged_in
        comment = Comment.find(params[:id])
        if current_user.id != comment.user_id
            flash[:message] = "You cannot delete that comment."
            redirect "/movies/#{comment.movie_id}"
        else
            comment.delete
            redirect "/movies/#{comment.movie_id}"
        end
    end

end