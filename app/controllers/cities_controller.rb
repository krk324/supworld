class CitiesController < ApplicationController

  def create
    if params[:city].present? && Geocoder.search(search_params[:city]).present?
      # Geocoder corret misspelled city name automatically.
      city_name = Geocoder.search(search_params[:city])[0].city || Geocoder.search(search_params[:city])[0].state || Geocoder.search(search_params[:city])[0].country
      @city = City.new(city: city_name)

      if City.where(city: city_name).empty? || @city.id.nil?
        @city.save
      else
        flash.now[:notice]=@city.errors.full_messages.join(', ')
        redirect_to :back
      end
      redirect_to city_path(City.where(city: @city.city)[0])

    else
      flash[:alert] = "Enter a city name"
      redirect_to root_path
    end

  end

  def show
    # show_html only can get info with in this method.
    @city = City.find(params[:id])
    @time_zone = Population.time_zone(@city.latitude,@city.longitude)

    @country_population = Population.country_population(@city.city)
    @wiki_url = Population.wiki_url(@city.city)

    if @city.tweets.blank? || @city.updated_at.utc + 30.minutes < Time.now.utc
      @trending_topics = Twit.trending_topics(@city.latitude,@city.longitude)
      @city.tweets = @trending_topics
      @city.save!
    else
      @trending_topics = @city.tweets
    end

    @images = Insta.images(@city.latitude,@city.longitude)
  end

  def search_params
    params.permit(:city)
  end

end
