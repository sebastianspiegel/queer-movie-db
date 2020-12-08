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

end