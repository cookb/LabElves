require 'rest-client'
require 'addressable/uri'
require 'json'

# figaro for this key (config/application.yml)
GOOGLE_API_KEY = ENV["GOOGLE_API_KEY"]

module ApplicationHelper
  # converts location (zip, city/state, address) to [latitude, longitude]
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
  def get_distance(lat1, long1, lat2, long2)
    term1 = (Math.sin((lat2 - lat1) * Math::PI / 360 )) ** 2
    term2 = Math.cos(lat1 * Math::PI / 180) * Math.cos(lat2 * Math::PI / 180)
    term3 = (Math.sin((long2 - long1) * Math::PI / 360 )) ** 2
    distance = (2 * 3959 * Math.asin(Math.sqrt(term1 + term2 * term3))).round(1) 
  end
end
