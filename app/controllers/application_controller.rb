require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end
##################create#################
  get '/posts/new' do
    # binding.pry
    erb :new
  end

  post '/posts' do

    @post= Post.new(params) #gets params from new.erb from /posts/new
    @post.save
    @posts = Post.all

    # binding.pry
     erb :index
  end

  get '/posts' do
    # binding.pry
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    # binding.pry
    @post = Post.find(params[:id].to_i)
  erb :show
end
#################edit######################
  get '/posts/:id/edit' do
    @post = Post.find(params[:id].to_i)
    erb :edit
end

patch '/posts/:id' do
  # binding.pry
 @post = Post.find(params[:id].to_i)
 @post.name = params[:name]
 @post.content = params[:content]
 @post.save
 redirect "/posts/#{@post.id}"
 end

 delete '/posts/:id/delete' do
   @post = Post.find(params[:id].to_i)
   @post_name = @post.name
   @post.delete

   "#{@post_name} was deleted"
 end


end
