require 'sinatra'
require 'sinatra/base'
require "sinatra/reloader" if development?
require 'erb'
require 'twitter'



class Twitsort < Sinatra::Base

  enable :sessions, :logging

  helpers do
    def hashtag_link(hashtag)
      hashtag1 = hashtag.delete "#"
      "<a href='http://twitter.com/#!/search/%23#{hashtag1}'>#{hashtag}</a>"
    end
    def twitter_user_link(user)
      "<a href='http://twitter.com/#!/#{user}'>@#{user}</a>"
    end
  end

  get '/' do
    session.clear
    erb :index
  end

  get '/search' do
    if params[:hashtag].empty?
      session.clear
      @error = "No te olvides de ingresar el hashtag!"
    else
      session[:users] = []
      session[:hashtag] = params[:hashtag]
      Twitter.search(session[:hashtag], :rpp => 100, :result_type => "recent").results.map do |tweet|
      session[:users] << tweet.from_user unless session[:users].include? tweet.from_user
      end
    end
    erb :index
  end

  get '/raffle' do 
    
    ganador = session[:users].shuffle.first

    Twitter.configure do |config|
      config.consumer_key = 'fODX2IwwdAdPpqCwa8FPQ'
      config.consumer_secret = 'GU8PCHZo3wxFfNv09ewiDut9Hu29J6fRyuAnXPaeY'
      config.oauth_token = '820628143-1z9xgsEzpz4iVrEfhD4pUNg8vo3HEuNM8AQqUZFl'
      config.oauth_token_secret = 'kYfBodu3VXsZM4GJDXQPqCZZsgchrPrHnoGvtNWeY'
    end

    Twitter.update("Hola @" + ganador + " has salido ganad@r de nuestro sorteo. Contactate con nosotros para enviarte tu premio!")
    twitter_user_link(ganador)
    
  end
  #start the server if ruby file executed directly
  run! if app_file == $0
end