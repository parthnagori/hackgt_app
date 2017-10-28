class RouteSearch < ApplicationRecord
  require 'uri'
  require 'net/http'
  require 'json'
  
  def self.get_air_quality(lat, lng)
    url = URI("https://api.breezometer.com/baqi/?lat=#{lat}&lon=#{lng}&key=#{ENV['BREEZOMETER_API_KEY']}")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'aa90a1e7-1f52-4d61-fc45-cdb05f4b50cd'
    res = http.request(request)
    response = JSON.parse(res.body)
    result = {}
    result['aqi'] = response['breezometer_aqi']
    result['color'] = response['breezometer_color']
    result['pollutant'] = response['dominant_pollutant_canonical_name']
    return result
  end

  # def self.get_best_route(routes)
  #   pollutant_list = ["co","no2","o3","pm10","pm25","so2"]
  #   puts "\n*"*10
  #   # puts routes
  #   puts "\n*"*10
    
  #   route_levels = []
  #   final_route = 0
  #   final_route_index = 0
  #   routes.each do |k, steps|
  #     step_weights = []
  #     total_time = 0
  #     pollutant_levels = {}
  #     pollutant_list.each do |pol|
  #       pollutant_levels[pol] = 0
  #     end
  #     steps.each do |step|
  #       # puts step
  #       lat = step['start_location']['lat']
  #       lng = step['start_location']['lng']
  #       air_quality = get_air_quality(lat,lng)
  #       puts "duration : #{step['duration']['text']}     pollutant : #{air_quality['pollutant']}"
  #       time = step['duration']['text'].split(' ')[0].to_i rescue 0
  #       pollutant_levels[air_quality['pollutant']]+=time
  #       total_time+=time
  #       step_weights << time*air_quality['aqi']
  #       puts "Step Weights : #{step_weights}"
  #       puts "#{air_quality['aqi']}"
  #     end
  #     route_levels << ((step_weights.sum)/total_time.to_f)
  #   end
  #   puts route_levels
  #   final_route_index = route_levels.index(route_levels.min) 
  #   return final_route_index
  # end

  def self.get_best_route(routes)
    pollutant_list = ["co","no2","o3","pm10","pm25","so2"]
    puts "\n*"*10
    # puts routes
    puts "\n*"*10
    
    route_levels = {}
    healthiest_route = []
    final_route = 0
    final_route_index = 0
    routes.each do |k, steps|
      step_weights = []
      total_time = 0
      pollutant_levels = {}
      pollutant_list.each do |pol|
        pollutant_levels[pol] = 0
      end
      aqi_index = []
      route_levels[k] = {}
      steps.each_with_index do |step, index|
        # puts step
        
        mod_val = (steps.length/10) + 1
        if(index%mod_val==0 && index != 0)  
          lat = step['start_location']['lat']
          lng = step['start_location']['lng']
          air_quality = get_air_quality(lat,lng)
          puts "duration : #{step['duration']['text']}     pollutant : #{air_quality['pollutant']}"
          time = step['duration']['text'].split(' ')[0].to_i rescue 0
          pollutant_levels[air_quality['pollutant']]+=time
          aqi_index << [air_quality['aqi'].to_s, lat, lng, air_quality['color'].split('#').last, air_quality['pollutant']]
          total_time+=time
          step_weights << time*air_quality['aqi']
          puts "Step Weights : #{step_weights}"
          puts "#{air_quality['aqi']}"
        end
      end
      route_levels[k]['pollutant_levels'] = pollutant_levels
      route_levels[k]['aqi_index'] = aqi_index 
      healthiest_route << ((step_weights.sum)/total_time.to_f)
    end
    final_route_index = healthiest_route.index(healthiest_route.max)
    route_levels['final_route'] = final_route_index 
    puts "\n$"*10
    puts route_levels
    puts "\n$"*10
    return route_levels
  end


end
