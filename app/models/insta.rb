class Insta

  def client
    Instagram.configure do |config|
      config.client_id = ENV["CLIENT_ID"]
      config.client_secret = ENV["CLIENT_SECRET"]
      # For secured endpoints only
      #config.client_ips = '<Comma separated list of IPs>'
    end
  end
end
