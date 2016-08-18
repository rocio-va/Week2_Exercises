require 'sinatra'
require './lib/calculator_class.rb'
require 'sinatra/reloader'
require 'pry'

enable(:sessions)


get "/" do
    @value = IO.read("./public/users.txt")
    #gestionamos el estado desde aquí
    #status(200)
    @name = session[:my_name] 
    #:my_name es una cookie para guardar datos
    erb :suma
end

post "/calculate" do
    first = params[:firstNumber].to_f #to_i sería mejor opción
    second = params[:secondNumber].to_f
    operation = params[:operation]
    result = Calculator.select_operation(first, second, operation)
    #session[:last_result] = result    
    session[:my_name] = "rocio"
    IO.write("./public/users.txt", result)
    #binding.pry
    "#{result}"
    redirect to("/")
end