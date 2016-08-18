require 'sinatra'
require 'sinatra/reloader'
require 'pry'

enable(:sessions)

get "/" do
    erb(:index)
end