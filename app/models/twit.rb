class Twit
  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_SECRET"]
    end
  end

  def self.trending_topics(latitude,longitude)

    Rails.cache.fetch([self, 'trending_topics'], expires_in: 5.minutes) do
      begin
        client = Twit.new.client

        woeid = client.trends_closest(lat: latitude, long: longitude)[0].id

        #return top 10 trending topics of that country
        client.trends(woeid).attrs[:trends].map {|obj| obj[:name]}
      rescue StandardError => e
        'Try again in 15 minutes to see the twitter trends.'
      end
    end
  end
end
