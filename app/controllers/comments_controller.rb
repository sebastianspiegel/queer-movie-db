class CommentsController < ApplicationController

    post '/comments' do
        #make sure correct user and logged in
        binding.pry 
        Comment.create(params)
        redirect "/movies/#{params[:movie_id]}"
    end
end