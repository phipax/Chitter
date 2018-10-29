require './lib/post'

describe 'Post Class retrieves and displays posts#' do
  context 'Checking for class instances and objects' do
    it 'Checks for the #Instance' do
      expect(Post.new).to be_instance_of(Post)
    end
  end
end
