require 'open-uri'

class ForecastController < ApplicationController
  def coords_to_weather_form
    # Nothing to do here.
    render("forecast/coords_to_weather_form.html.erb")
  end

  def coords_to_weather
    @lat = params[:user_latitude]
    @lng = params[:user_longitude]

    # ==========================================================================
    # Your code goes below.
    # The latitude the user input is in the string @lat.
    # The longitude the user input is in the string @lng.
    # ==========================================================================
    url = "https://api.darksky.net/forecast/[406dd21b4907ee4714541f89765e9316]/"


add = "["+@lat.to_s + ",]"+ "["+"]"+@lng.to_s"]"


    url_useredit = url + add.gsub(" ","+")

    parsed_data = JSON.parse(open(url_useredit).read)
    latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]




    @current_temperature = "Replace this string with your answer."

    @current_summary = "Replace this string with your answer."

    @summary_of_next_sixty_minutes = "Replace this string with your answer."

    @summary_of_next_several_hours = "Replace this string with your answer."

    @summary_of_next_several_days = "Replace this string with your answer."

    render("forecast/coords_to_weather.html.erb")
  end
end
