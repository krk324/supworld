require 'rails_helper'

#same as describe
feature 'User views city' do
  # same as it in rspec ruby
  scenario 'with all attributes' do
    visit root_path
    fill_in 'Search', with: 'NY'
    click_button 'Search city'

    expect(page).to have_content GeoNamesAPI::Country.find('US').population


  end

end
