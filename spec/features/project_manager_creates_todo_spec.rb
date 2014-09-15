require 'rails_helper'

feature 'Project manager creates TODO' do
  scenario 'Successfully' do
    visit new_todo_path
    fill_in 'Description', :with => 'Feed the fail whales'
    click_button 'Save'
    expect( page ).to have_content("Your new TODO was saved!")
    expect( page ).to have_content("Feed the fail whales")
  end

  scenario 'With description missing' do
    visit new_todo_path
    fill_in 'Description', :with => ''
    click_button 'Save'
    expect( page ).to have_content("Sorry, your task couldn't be saved. It needs a description.")
  end
end

# PM goes to TODO creation page
# PM submits new TODO description
# PM sees confirmation message
# PM sees newly saved TODO

