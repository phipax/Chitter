require 'pg'

class UserAuthenticate

  attr_reader :user_auth, :authstatus, :user_hash

  def self.validate(username,userpwd)
  #  p "#{username} #{userpwd}"
    @user_auth = UserAuthenticate.new
  #  p @user_auth
    @user_auth.authuser(username,userpwd)
  end

  def initialize
    if ENV['ENVIRONMENT'] == 'test'
  #    p "test"
      @connection = PG.connect(dbname: 'chitter_test')
  #    p @connection
    else
  #    p "Prod"
      @connection = PG.connect(dbname: 'chitter')
  #    p @connection
    end
    @authstatus = false
    @user_hash = Hash.new
    #authuser
  end

  def authuser(usr,pwd)
  #  p "#{usr} #{pwd}"
    prep_str = 'select user_id,email_id,user_name,user_handle from users where '
    prep_str << "user_handle='#{usr}' and password='#{pwd}';"

    result = @connection.exec(prep_str)
  #  p result
    result.map { |bookmark|
      @user_hash[:user_id]=bookmark['user_id']
      @user_hash[:email_id]=bookmark['email_id']
      @user_hash[:user_name]=bookmark['user_name']
      @user_hash[:user_handle]=bookmark['user_handle']
    }
    @authstatus = true if @user_hash.count > 0
  end

end
