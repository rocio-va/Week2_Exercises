require 'sinatra'
require 'sinatra/reloader'
require_relative './lib/task'
require_relative './lib/todoList'
require 'pry'

enable(:sessions)
    # todo_list =TodoList.new("Rocio")
    # task = Task.new("Buy milk", Time.local(2016, 8, 15, 7, 6))
    # task2 = Task.new("Wash the car", Time.local(2015, 8, 23, 7, 6))
    # todo_list.add_task(task)
    # todo_list.add_task(task2)

get '/' do
    "Hello, World"
end

get '/real_page' do
    "The other page"
end

get '/hi' do
    redirect 'real_page'
end    


get '/tasks' do
    if(session[:tasks].nil?)
        @tasks = []
    else
        @tasks = session[:tasks]
    end
    #todo_list =TodoList.new("Rocio", )
    #@tasks = todo_list.tasks
    erb :task_index
end

get '/new_task' do    
    erb :new_task
end

post '/create_task' do
    content = params[:content]
    #session[:tasks]
    #binding.pry
    if(session[:tasks].nil?)
        todo_list =TodoList.new("Rocio")
    else
        todo_list =TodoList.new("Rocio", session[:tasks])
    end
    new_task = Task.new(content, Time.now)
    todo_list.add_task(new_task)
    session[:tasks] = todo_list.tasks
    redirect to('/tasks')
end

get '/complete_task/:id' do
    id = params[:id].to_i
    todo_list =TodoList.new("Rocio", session[:tasks])
    task = todo_list.find_task_by_id id
    task.complete!
    session[:tasks] = todo_list.tasks
    redirect to('/tasks')
end

get '/delete_task/:id' do
    id = params[:id].to_i
    todo_list =TodoList.new("Rocio", session[:tasks])
    todo_list.delete_task id
    session[:tasks] = todo_list.tasks
    redirect to('/tasks')
end