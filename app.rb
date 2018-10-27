require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  
  before do

  end

  get '/' do
    redirect '/chitter/login'
  end

  get '/chitter/login' do
    erb :login
  end

  post 'chitter/validate' do

  end

  get '/chitter' do

    erb :chitter
  end

  run! if app_file == $0
end
