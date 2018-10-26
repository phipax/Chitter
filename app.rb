require 'sinatra/base'

class Chitter < Sinatra::Base
  enable :sessions
  before do

  end
  run! if app_file == $0
end
