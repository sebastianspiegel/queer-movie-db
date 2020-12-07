class ShowsController < ApplicationController

    get '/shows' do
        erb :'/index'
    end

    get '/shows/new' do
        redirect_if_not_logged_in
        erb :'shows/new'
    end

    get '/shows/:id' do
        @show = Show.find(params[:id])
        erb :'/shows/show'
    end

    post '/shows' do
        if params[:title].blank? || Show.find_by_title(params[:title])
            redirect '/shows/new'
        else
            @show = Show.create(params)
            @show.user = current_user
            redirect "/shows/#{@show.id}"
        end
    end

    get '/shows/:id/edit' do
        @show = Show.find(params[:id])
        erb :'shows/edit'
    end

    patch '/shows' do
        binding.pry 
    end

    delete '/shows/:id/delete' do
        binding.pry 
    end
end