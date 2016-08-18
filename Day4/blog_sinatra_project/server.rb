require 'sinatra'
require 'sinatra/reloader'
require './lib/blog'
require './lib/post'
require 'pry'



enable(:sessions)
get '/' do
    text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    post1 = Post.new("primer post", text, "pepito", "cat")
    post2 = Post.new("post 15", text, "rocio", "cat4")
    post3 = Post.new("mi segundo post", text, "jaimito", "cat3")
    post4 = Post.new("titulo post", text, "rocio", "cat4")
    post5 = Post.new("title post", text, "pepito", "cat3")
    session[:posts] = [post1, post2, post3, post4, post5]
    redirect '/posts'    
end

get '/posts' do
    if(session[:posts].nil?)
        @posts = []
        session[:posts] = @posts
    else
        @posts = session[:posts]
    end
    erb :posts    
end

get '/post_details/:index' do
    index = params[:index].to_i
    @post = session[:posts][index]
    erb :post_details
end

get '/new_post' do
    erb :new_post
end

post '/create_post' do
    title = params[:title]
    text = params[:text]
    author = params[:author]
    category = params[:category]
    #binding.pry
    post = Post.new(title, text, author, category)
    blog = Blog.new(session[:posts])
    #binding.pry
    blog.add_post(post)
    #binding.pry
    session[:posts] = blog.posts
    #binding.pry
    redirect '/posts'

end
