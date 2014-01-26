# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'rubygems'
require 'net/http'
require 'JSON'

class Hash
  def except(*keys)
    dup.except!(*keys)
  end

  # Replaces the hash without the given keys.
  def except!(*keys)
    keys.each { |key| delete(key) }
    self
  end
end

class Geocode 
  
  def local(name)
    call = '/maps/api/geocode/json'
    
    params = Hash.new
    params[:address] = name
    p params
    
    API::query(call, params)
  end
  
  class API
    def self.query(call, params)
      
      params[:sensor] = false
      params[:components] = 'country:US'
      
      url = 'https://maps.googleapis.com' + call + '?' + URI.encode_www_form(params)
      p url
      
      @api = URI(url)
      
      p params
      
      request = Net::HTTP::Get.new(@api)
      #request.body = JSON::generate(params)
      #request['version'] = 'ios_3.0.0'
      
      response = Net::HTTP.start(@api.hostname, @api.port, :use_ssl => true) do |http|
        http.request(request)
      end
      # raw = Net::HTTP.get_response(uri)
      
      JSON.parse(response.body) # return
    end
  end
end

def getCoordinatesForCity(city)
  gc = Geocode.new
  query = gc.local city
  results = query['results'].first
  coor = results['geometry']['location']

  coor['lon'] = coor['lng']
  coor.except!('lng')
end 

def getAllCoordinates(cities)
  table = Hash.new
  
  cities.each do |city|
    table[city] = getCoordinatesForCity(city)
  end
  
  table
end

cities = [
  "Las Vegas",
  "New York City",
  "San Diego",
  "Los Angeles",
  "Chicago",
  "San Francisco",
  "Seattle"
]

data = getAllCoordinates(cities)

data.each do |key, value|
  Location.create!(:location => key, :lat => value['lat'], :lon => value['lon'])
end

whis = Whisper.new

Location.all.each do |location|
  results = whis.nearby :lat => location.lat, :lon => location.lon, :limit => 20
  puts "$(location.location) finished image processing"
  results.each do |whisper|
    Anycdote.create!(:story => whisper['text'], :location => location.location, :user_id => 1, :image => whisper['url'])
  end
end
