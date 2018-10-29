require 'sinatra/base'
require './lib/userauthenticate'
require './lib/post'
require './lib/userpost'

class Chitter < Sinatra::Base
  enable :sessions

  before do

  end

  get '/' do
    redirect '/chitter/login'
  end

  get '/chitter/login' do
    session[:username] = ""
    session[:passkey] = ""
    erb :login
  end

  post '/chitter/validate' do
    case params[:submit]
    when "Login"
      usr_name = params[:UserName]
      usr_pwd  = params[:psw]
      session[:username] = usr_name
      session[:passkey] = usr_pwd
      #p "#{session[:username]} #{session[:passkey]}"
      @uauth = UserAuthenticate.validate(usr_name,usr_pwd)
      @uauth == true ?  session[:loginstatus] = "OK" : session[:loginstatus] = "Login Failed.. Please retry"
      redirect '/chitter' if @uauth
      redirect back
    when "Cancel"
      redirect back
    end
  end

  get '/chitter' do
#    p "From Chitter #{session[:username]} #{session[:passkey]}"
    redirect '/chitter/login' if session[:loginstatus] == ""
    @posts = Post.display
  #  p @posts
    erb :chitter
  end

  post '/chitter/post' do
    @peep = UserPost.create(params[:peeps])
    redirect '/chitter'
  end

  run! if app_file == $0
end
