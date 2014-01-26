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

class Whisper
  
  def nearby(params)
    call = '/whispers/nearby/distance'
    
    params[:include_topics] = TRUE unless params.key?(:include_topics)
    
    API.query(call, params)['nearby']
  end
  
  def popular(params = {})
    call = '/whispers/popular/popular'
    
    params[:include_topics] = TRUE unless params.key?(:include_topics)
    
    API.query(call, params)['popular']
  end
  
  def featured(params)
    call = '/whispers/popular/all_time'
    
    params[:include_topics] = TRUE unless params.key?(:include_topics)
    
    API.query(call, params)['popular']
  end
  
  def suggest(params)
    call = "/search/suggest/" + params[:text]
    
    params.except!(:text)
    
    params[:type] = 'place' unless params.key?(:type)
    
    API.query(call, params)
  end
  
  def find(params)
    call = '/feed/whispers'
    
    API.query(call, params)
  end
  
  class API
    def self.query(call, params)
      @api = URI('https://hackproxy.whisper.sh' + call + '?' + URI.encode_www_form(params))
      
      request = Net::HTTP::Get.new(@api)
      # request.body = JSON::generate(params)
      #request['version'] = 'ios_3.0.0'
      
      response = Net::HTTP.start(@api.hostname, @api.port, :use_ssl => true) do |http|
        http.request(request)
      end
      
      # raw = Net::HTTP.get_response(uri)
      
      JSON.parse(response.body) # return
    end
  end
end
