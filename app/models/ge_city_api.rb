class GeCityApi < ApplicationRecord

  require 'uri'
  require 'net/http'

  def self.get_asset_list
    # url = URI("https://ic-metadata-service.run.aws-usw02-pr.ice.predix.io/v2/metadata/assets/search?bbox=32.715675%3A-117.161230%2C32.708498%3A-117.151681&page=0&size=200&q=eventTypes%3APKIN")
    # http = Net::HTTP.new(url.host, url.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # request = Net::HTTP::Get.new(url)
    # request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI3NjI1ZTkzNjE1ODQ0YjNjOThiMmI0MDFhZTA0YmEyNSIsInN1YiI6ImhhY2thdGhvbiIsInNjb3BlIjpbInVhYS5yZXNvdXJjZSIsImllLWN1cnJlbnQuU0RTSU0tSUUtUFVCTElDLVNBRkVUWS5JRS1QVUJMSUMtU0FGRVRZLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEFSS0lORy5JRS1QQVJLSU5HLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEVERVNUUklBTi5JRS1QRURFU1RSSUFOLkxJTUlURUQuREVWRUxPUCJdLCJjbGllbnRfaWQiOiJoYWNrYXRob24iLCJjaWQiOiJoYWNrYXRob24iLCJhenAiOiJoYWNrYXRob24iLCJncmFudF90eXBlIjoiY2xpZW50X2NyZWRlbnRpYWxzIiwicmV2X3NpZyI6IjlmMWYyYzRkIiwiaWF0IjoxNTA4MDM3NDYxLCJleHAiOjE1MDg2NDIyNjEsImlzcyI6Imh0dHBzOi8vODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3LnByZWRpeC11YWEucnVuLmF3cy11c3cwMi1wci5pY2UucHJlZGl4LmlvL29hdXRoL3Rva2VuIiwiemlkIjoiODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3IiwiYXVkIjpbImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBBUktJTkcuSUUtUEFSS0lORy5MSU1JVEVEIiwiaWUtY3VycmVudC5TRFNJTS1JRS1QVUJMSUMtU0FGRVRZLklFLVBVQkxJQy1TQUZFVFkuTElNSVRFRCIsInVhYSIsImhhY2thdGhvbiIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBFREVTVFJJQU4uSUUtUEVERVNUUklBTi5MSU1JVEVEIl19.HYi54LkkgeBeZGI0kdVqy1gWfa9FLuiunwhAC8tQp6-aMTUtQeCjY007r1Cz5kEPRDC6T_kRX7-ItzbIzSBLsmrcc1Fn4OKrPsLqkueK15ul3cpiNyD-5n9DYTyNDTQg45Jw2h5FbvUDQbn_roUIz-B5I_7eZvP7VCruM-EcNw2WMWRjZBQ4u2z_PaK0LL0TnUPBNNWx-450sZxnQF37L7dqDLMIhHylMeSHv1GKth4a6uzBe1DakrpI8KJoC34HmxAlzBh2KYreUfRf2zLiHY0H7UFgJ5k273np-Uy0epgpcFGpWYOsq8HSjnAy8ZS6QzQNMh7P7fCHb62skHymrA'
    # request["predix-zone-id"] = 'SDSIM-IE-PARKING'
    # request["cache-control"] = 'no-cache'
    # request["postman-token"] = '452680bd-d3f2-8780-86b1-6651b62236f0'
    # response = http.request(request)

    # assets = response.body
    # asset_list = []
    # assets[:content].each do |asset|
    #   asset_list << asset[:assetUid]

    return ["CAM-HYP1071-F", "CAM-HYP1065-F", "CAM-HYP1073-F", "CAM-HYP1081-F", "CAM-HYP1042-F", "CAM-HYP1077-F", "CAM-HYP1039-F"]
  end

  def self.get_asset_historical_data
    assets_history = {"CAM-HYP1071-F"=>{"direction"=>88.2, "pedestrianCount"=>22.556, "speed"=>3.092}, "CAM-HYP1065-F"=>{"direction"=>178.56, "pedestrianCount"=>21.8915, "speed"=>3.09}, "CAM-HYP1073-F"=>{"direction"=>179.28, "pedestrianCount"=>22.9238, "speed"=>2.998}, "CAM-HYP1081-F"=>{"direction"=>18.432, "pedestrianCount"=>21.9151, "speed"=>3.092}, "CAM-HYP1042-F"=>{"direction"=>270.9, "pedestrianCount"=>22.0493, "speed"=>3.084}, "CAM-HYP1077-F"=>{"direction"=>88.74, "pedestrianCount"=>22.0877, "speed"=>3.086}, "CAM-HYP1039-F"=>{"direction"=>180.9, "pedestrianCount"=>21.9528, "speed"=>3.105}}
    return assets_history
  end

  def self.get_asset_current_data(asset_list)
    assets_current = {"CAM-HYP1071-F"=>{"direction"=>90, "pedestrianCount"=>24, "speed"=>3.5}, "CAM-HYP1065-F"=>{"direction"=>180, "pedestrianCount"=>23, "speed"=>3.2}, "CAM-HYP1073-F"=>{"direction"=>170, "pedestrianCount"=>27, "speed"=>3}, "CAM-HYP1081-F"=>{"direction"=>20, "pedestrianCount"=>79, "speed"=>6.67}, "CAM-HYP1042-F"=>{"direction"=>270, "pedestrianCount"=>23, "speed"=>3.3}, "CAM-HYP1077-F"=>{"direction"=>90, "pedestrianCount"=>25, "speed"=>2.9}, "CAM-HYP1039-F"=>{"direction"=>190, "pedestrianCount"=>24, "speed"=>3}}
    return assets_current
  end

  def self.check_anomalies(current_assets, historical_assets)
    outlier_asset = "CAM-HYP1081-F"
    auth_key = 'Bearer eyJhbGciOiJSUzI1NiIsImtpZCI6ImxlZ2FjeS10b2tlbi1rZXkiLCJ0eXAiOiJKV1QifQ.eyJqdGkiOiI3NjI1ZTkzNjE1ODQ0YjNjOThiMmI0MDFhZTA0YmEyNSIsInN1YiI6ImhhY2thdGhvbiIsInNjb3BlIjpbInVhYS5yZXNvdXJjZSIsImllLWN1cnJlbnQuU0RTSU0tSUUtUFVCTElDLVNBRkVUWS5JRS1QVUJMSUMtU0FGRVRZLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEFSS0lORy5JRS1QQVJLSU5HLkxJTUlURUQuREVWRUxPUCIsImllLWN1cnJlbnQuU0RTSU0tSUUtUEVERVNUUklBTi5JRS1QRURFU1RSSUFOLkxJTUlURUQuREVWRUxPUCJdLCJjbGllbnRfaWQiOiJoYWNrYXRob24iLCJjaWQiOiJoYWNrYXRob24iLCJhenAiOiJoYWNrYXRob24iLCJncmFudF90eXBlIjoiY2xpZW50X2NyZWRlbnRpYWxzIiwicmV2X3NpZyI6IjlmMWYyYzRkIiwiaWF0IjoxNTA4MDM3NDYxLCJleHAiOjE1MDg2NDIyNjEsImlzcyI6Imh0dHBzOi8vODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3LnByZWRpeC11YWEucnVuLmF3cy11c3cwMi1wci5pY2UucHJlZGl4LmlvL29hdXRoL3Rva2VuIiwiemlkIjoiODkwNDA3ZDctZTYxNy00ZDcwLTk4NWYtMDE3OTJkNjkzMzg3IiwiYXVkIjpbImllLWN1cnJlbnQuU0RTSU0tSUUtVFJBRkZJQy5JRS1UUkFGRklDLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBBUktJTkcuSUUtUEFSS0lORy5MSU1JVEVEIiwiaWUtY3VycmVudC5TRFNJTS1JRS1QVUJMSUMtU0FGRVRZLklFLVBVQkxJQy1TQUZFVFkuTElNSVRFRCIsInVhYSIsImhhY2thdGhvbiIsImllLWN1cnJlbnQuU0RTSU0tSUUtRU5WSVJPTk1FTlRBTC5JRS1FTlZJUk9OTUVOVEFMLkxJTUlURUQiLCJpZS1jdXJyZW50LlNEU0lNLUlFLVBFREVTVFJJQU4uSUUtUEVERVNUUklBTi5MSU1JVEVEIl19.HYi54LkkgeBeZGI0kdVqy1gWfa9FLuiunwhAC8tQp6-aMTUtQeCjY007r1Cz5kEPRDC6T_kRX7-ItzbIzSBLsmrcc1Fn4OKrPsLqkueK15ul3cpiNyD-5n9DYTyNDTQg45Jw2h5FbvUDQbn_roUIz-B5I_7eZvP7VCruM-EcNw2WMWRjZBQ4u2z_PaK0LL0TnUPBNNWx-450sZxnQF37L7dqDLMIhHylMeSHv1GKth4a6uzBe1DakrpI8KJoC34HmxAlzBh2KYreUfRf2zLiHY0H7UFgJ5k273np-Uy0epgpcFGpWYOsq8HSjnAy8ZS6QzQNMh7P7fCHb62skHymrA'

    url = URI("https://ic-media-service.run.aws-usw02-pr.ice.predix.io/v2/mediastore/ondemand/assets/#{outlier_asset}/media?mediaType=IMAGE&timestamp=1507852800000")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = auth_key
    request["predix-zone-id"] = 'SDSIM-IE-PUBLIC-SAFETY'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '2cb04014-e5cb-0ec6-31dd-cc8567c7b511'
    res = http.request(request)
    response = JSON.parse(res.body)
    u1 = response.values.first

    url = URI(u1)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = auth_key
    request["predix-zone-id"] = 'SDSIM-IE-PUBLIC-SAFETY'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '32fdb046-f62d-0be2-741e-55a7984a74c7'
    res = http.request(request)
    response = JSON.parse(res.body)
    u2 = response.values.first

    u2 = "https://ic-media-service.run.aws-usw02-pr.ice.predix.io/v2/mediastore/file/CAM-HYP1081-F_1508061191000_10_VIDEO_mp4"
    url = URI(u2)
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = auth_key
    request["predix-zone-id"] = 'SDSIM-IE-PUBLIC-SAFETY'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = 'f3df1be8-d239-9911-7051-4e0040f6a9a6'

    response = http.request(request)
    media = response.body
    tmp_path = "#{Rails.root}/public/media.mp4"
    File.open(tmp_path, 'wb+') do |file|
      file << media
    end
    return {"#{outlier_asset}": "media.mp4"}    
  end

end
