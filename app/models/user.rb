require 'rest-client'
require 'addressable/uri'
require 'json'

GOOGLE_API_KEY = "AIzaSyC7fyciy8pqjDPyz0RS2SaZdlyHUY_CgGs"

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :trackable, :lockable, :timeoutable and :omniauthable
  
  devise :database_authenticatable, :registerable, :recoverable, 
         :rememberable, :confirmable, :validatable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    :name, :location, :education, :institution, :link, :lat_long, :credits
  
  validates :name, :education, :location, presence: true
  
  # specs authored
  has_many :authored_specs, :class_name => "Specialty", :foreign_key => :author_id    

  # specialties
  has_many :spec_joins, :class_name => "SpecJoin", :foreign_key => :user_id
  has_many :specialties, :through => :spec_joins
  
  # bids
  has_many :bids, :class_name => "Bid", :foreign_key => :elf_id
  
  # tasks
  has_many :user_tasks, :class_name => "Task", :foreign_key => :user_id
  has_many :elf_tasks, :class_name => "Task", :foreign_key => :elf_id    
  
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
  # or just use geocoder gem??
  def distance(lat_long1, lat_long2)
    
  end
end
