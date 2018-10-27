feature 'Testing login page' do
  scenario 'Chitter Login Page check' do
    visit('/chitter/login')
    expect(page).to have_content 'Login to use Chitter'
  end

  scenario 'Chitter Login Page:: UserName check' do
    visit('/chitter/login')
    expect(find_field('UserName')).to be_instance_of(Capybara::Node::Element)
    expect(find_field('psw')).to be_instance_of(Capybara::Node::Element)
    expect(find_button('Login')).to be_instance_of(Capybara::Node::Element)
    expect(find_button('Cancel')).to be_instance_of(Capybara::Node::Element)
    expect(find_link('signup')).to be_instance_of(Capybara::Node::Element)
    expect(find_link('forgot')).to be_instance_of(Capybara::Node::Element)        
  end

end
