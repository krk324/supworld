require 'csv'

namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do

    City.delete_all

    csv_text = File.read('/Users/krk32488/GA_Projects/projects/project1/worldcitiespop.csv').encode!('UTF-8', 'UTF-8', :invalid => :replace)
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      City.create!(row.to_hash)
    end

    # u1 = User.create!(email: 'fred@example.com', password: 'password')
    # u2 = User.create!(email: 'george@example.com', password: 'password')

    # Status.create!(user: u1, content: "Test status with some content", created_at: 1.day.ago)
    # Status.create!(user: u1, content: "Another test with different content", created_at: 3.days.ago)
    # Status.create!(user: u2, content: "A new challenger approaches with a status", created_at: 2.days.ago)
    # Status.create!(user: u1, content: "I sure do post a lot of statuses", created_at: 5.days.ago)
    # Status.create!(user: u2, content: "Second user posts things less often", created_at: 7.days.ago)
    # Status.create!(user: u2, content: "Vague and inspiring quotation or somesuch", created_at: 10.days.ago)

    # Link.create!(user: u1, url: 'http://generalassemb.ly', title: 'General Assembly', created_at: 2.days.ago)
    # Link.create!(user: u2, url: 'http://guides.rubyonrails.org', title: 'Rails Guides', created_at: 4.days.ago)
    # Link.create!(user: u2, url: 'http://api.rubyonrails.org', title: 'Rails API Documentation', created_at: 5.days.ago)
    # Link.create!(user: u1, url: 'http://xkcd.com', title: 'Nerd Joke Central', created_at: 9.days.ago)


  end
end
