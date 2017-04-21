require 'open-uri'



class GeocodingController < ApplicationController
  def street_to_coords_form
    # Nothing to do here.
    render("geocoding/street_to_coords_form.html.erb")
  end

  def street_to_coords
    @street_address = params[:user_street_address]



    url = "http://maps.googleapis.com/maps/api/geocode/ison?address="

    url_useredit = url + @street_address.gsub(" ","+")

    parsed_data = JSON.parse(open(url_useredit).read)
    latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

    @latitude = latitude

    @longitude = longitude

    render("geocoding/street_to_coords.html.erb")
  end
end
