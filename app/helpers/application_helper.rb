require 'rest-client'
require 'addressable/uri'
require 'json'

GOOGLE_API_KEY = "AIzaSyC7fyciy8pqjDPyz0RS2SaZdlyHUY_CgGs"

module ApplicationHelper
  def get_lat_lng(location)
    url = Addressable::URI.new(
      :scheme => "https",
      :host => "maps.googleapis.com",
      :path => "/maps/api/geocode/json",
      :query_values => { :address => location, :sensor => "false" }    
    ).to_s
    
    response = JSON.parse(RestClient.get(url))
    top_result = response["results"].first
    top_result["geometry"]["location"].values_at("lat", "lng")
  end
  
  # calculates distance (in miles) between two lat/longs using Haversine formula
  # or just use geocoder gem??
  def distance(lat_long1, lat_long2)
    
  end
end
