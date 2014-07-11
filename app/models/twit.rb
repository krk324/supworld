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
    client = Twit.new.client
    woeid = client.trends_closest(lat: latitude, long: longitude)[0].id

    #return top 10 trending topics of that country
    client.trends(woeid).attrs[:trends].map {|obj| obj[:name]}
  end
end
