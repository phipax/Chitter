feature 'Testing the basic web-page' do
  scenario 'Check to see if the page contains a text area to type peeps in' do
    visit('/chitter')
    expect(find_field('peeps').value).to eq 'pee here!'
  end

  scenario 'Check to see if the page contains a button to post' do
    visit('/chitter')
    expect(find_button('peep').value).to eq "peep"
  end
end
