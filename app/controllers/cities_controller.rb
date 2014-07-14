class CitiesController < ApplicationController

  def create
    city_object = Geocoder.search(search_params[:city])
    if params[:city].present? && city_object.present?
      # Geocoder search for city name that exists and return it as object.
      # Object has many attributes such as country_name, city_name, and coordinates.
      city_name = city_object.first.city || city_object.first.state || city_object.first.country
      @city = City.new(city: city_name)

      if City.where(city: city_name).empty?
        @city.save
      end
      redirect_to city_path(City.where(city: @city.city)[0])

    else
      flash[:alert] = "Enter a city name"
      redirect_to root_path
    end

  end

  def show
    @city = City.find(params[:id])
    @time_zone = Population.time_zone(@city.latitude,@city.longitude)

    # Store wiki url only if wiki_url column is blank.
    if @city.wiki_url.blank?
      @wiki_url = Population.wiki_url(@city.city)
      @city.wiki_url = @wiki_url
      @city.save!
    else
      @wiki_url = @city.wiki_url
    end

    # Use api only when population information is more than a year ago.
    if @city.population.blank? || @city.updated_at.utc + 1.years < Time.now.utc
      @country_population = Population.country_population(@city.city)
      @city.population = @country_population
      @city.save!
    else
      @country_population = @city.population
    end

    # If object exist get existing tweets from database. Else create new tweet object.
    # Store new tweets to the database if tweets were stored 30 minutes ago.
    # else display tweets in the database.
    tweets = @city.tweets.find_or_create_by(city_id: @city.id)
    if tweets.tweet.blank? || @city.tweets.first.updated_at.utc + 30.minutes < Time.now.utc
      @trending_topics = Twit.trending_topics(@city.latitude,@city.longitude)
      tweets.tweet = @trending_topics
      tweets.save!
    else
      @trending_topics = @city.tweets.first.tweet
    end

    # Same logic as fetching tweets.
    # Store new images to the database if images were stored 10 minutes ago.
    images = @city.images.find_or_create_by(city_id: @city.id)
    if images.image.blank? || @city.images.first.updated_at.utc + 10.minutes < Time.now.utc
      @new_images = Insta.images(@city.latitude,@city.longitude)
      images.image = @new_images
      images.save!
    else
      @new_images = @city.images.first.image
    end

  end

  def search_params
    params.permit(:city)
  end

end
