require './config/environment'
require 'pry'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    if Helper.is_logged_in?(session)
      @tweets = Tweet.all
      erb :show
    else
      erb :index
    end
  end

end
