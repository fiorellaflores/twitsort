require 'sinatra'
require 'sinatra/base'
require "sinatra/reloader" if development?
require 'erb'
require 'twitter'

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
  twitter_user_link(session[:users].shuffle.first)
end