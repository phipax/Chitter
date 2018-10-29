require './lib/userauthenticate'

class Post
  attr_reader :posts_list
  def initialize
    @posts_list = []
    @record_item = ""
    if ENV['ENVIRONMENT'] == 'test'
    #    p "test"
      @connection = PG.connect(dbname: 'chitter_test')
    #    p @connection
    else
    #    p "Prod"
      @connection = PG.connect(dbname: 'chitter')
    #    p @connection
    end
  end

  def self.display
    @post = Post.new
    @post.getposts
  end

  def getposts
    #    @post.getposts if UserAuthenticate.validate(user,session[:passkey])
    prep_str = 'select posts.post_text,posts.created_date_time,posts.createdby_id,users.user_name,users.user_handle from posts INNER JOIN users ON posts.createdby_id = users.user_id ORDER BY posts.created_date_time DESC;'
    result = @connection.exec(prep_str)
    #  p result
    result.map { |post|
      @record_item = {:text => post['post_text'], :created_on => post['created_date_time'], :userh=> post['user_handle'], :usern=> post['user_name']}
      @posts_list.push(@record_item)}
    @posts_list
  end
end
