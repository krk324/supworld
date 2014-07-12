require 'rails_helper'

feature "User creates a memo" do

  scenario 'successfully' do
    visit root_path
    fill_in 'city', with: 'singapore'
    click_button 'Search'
    click_link 'Add Memo'

    fill_in 'Memo', with: 'Hello'
    click_button 'Create Memo'


    expect(page).to have_content 'Hello'


    # Keep in mind making the test too specefic will break the rspec when
    # chaging your css style.
  end

  # scenario 'unsuccessfully due to required fields being blank' do

  # end
end
