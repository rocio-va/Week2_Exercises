require_relative '../server.rb'
#require './server.rb'
require 'rspec'
require 'rack/test'
require 'pry'

describe "Server test" do
    include Rack::Test::Methods #incluye los metodos para testear las rutas get, post

    def app
        Sinatra::Application #incluye el entorno de nuestra app
    end
    it "should load the home page" do
        get '/'
        expect(last_response).to be_ok
    end
    it "should load real page" do
        get 'real_page'
        expect(last_response.body).to eq("The other page")
    end
    it "should redirect to real page /" do
        get '/hi'
        #binding.pry
        expect(last_response.redirect?).to be(true)
        follow_redirect!
        #binding.pry
        expect(last_request.path).to eq('/real_page')
    end

end 