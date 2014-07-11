require 'rails_helper'

#same as describe
feature 'User views city' do
  # same as it in rspec ruby
  scenario 'with all attributes' do
    visit root_path
    fill_in 'city', with: 'singapore'
    click_button 'Search'

    expect(page).to have_content GeoNamesAPI::Country.find('SG').population


  end

end
