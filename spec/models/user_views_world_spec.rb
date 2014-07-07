require 'rails_helper'

#same as describe
feature 'User views root' do
  # same as it in rspec ruby
  scenario 'with all attributes' do

    visit root_path
    #visit is a Capybara method!
    # Equivalent to typing the path into the user's address bar.

    # check the content within the tr tag.
    # '.player ' will check if the content inside the .player class.

    # will open up a snap shot of html for you.
    expect(page).to have_content 'About World'
    expect(page).to have_content GeoNamesAPI::Country.all.map(&:population).reduce(0, :+)


    # 'have_content' matcher looks at only the user-visible text on the
    # page, and searches for the string we give it within that text.
  end

end
