require 'rails_helper'

#same as describe
feature 'User views world' do
  # same as it in rspec ruby
  scenario 'with all attributes' do

    visit root_path

    expect(page).to have_content 'About World'
    expect(page).to have_content GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)

  end

end
