# Route.delete_all
# source = GTFS::Source.build('http://www.mbta.com/uploadedfiles/MBTA_GTFS.zip')
# routes = source.routes
# routes.each do |r|
#   route = Route.create(
#     long_name: r.long_name,
#     short_name: r.short_name,
#     route_id: r.id,
#     mode_name: r.desc,
#     mode_id: r.type,
#     color: r.color
#   )
# end
Route.delete_all
response = HTTParty.get('https://api.transitfeeds.com/v1/getLocations?key=98729669-6e3a-4cb9-b68d-c89174e81af2')
data = JSON.parse(response.body)
locations = data["results"]["locations"]
us_locations = []
locations.each do |loc|
  if loc["t"].include?("USA")
    us_locations.push loc
  end
end

boston = us_locations[38]
nyc = us_locations[227]
ny = us_locations[228]
sanfran = us_locations[301]
losang = us_locations[173]
capecod = us_locations[54]
cali = us_locations[52]
mass = us_locations[188]
sample = [boston, sanfran, losang, capecod, cali, mass]
agencies_with_bad_links = []
sample.each do |tran|
  city = tran["n"]
  id = tran["id"]
  response = HTTParty.get("https://api.transitfeeds.com/v1/getFeeds?key=98729669-6e3a-4cb9-b68d-c89174e81af2&location=#{id}&descendants=1&page=1&limit=500&type=gtfs")
  loc_data = JSON.parse(response.body)
  loc_data["results"]["feeds"].each do |agency|
    agency_id = agency["id"]
    authority = agency["t"].chomp("GTFS").strip
    begin
      source = GTFS::Source.build("https://transitfeeds-data.s3-us-west-1.amazonaws.com/public/feeds/#{agency_id}/20170530/gtfs.zip")
    rescue GTFS::InvalidSourceException
      puts agency_id + " does not have a valid gtfs link"
      agencies_with_bad_links.push(agency_id)
    else
      routes = source.routes
      routes.each do |r|
        # puts "city: #{city}, authority: #{authority}, long_name: #{r.long_name}, short_name: #{r.short_name}, route_id: #{r.id}, description: #{r.desc}, route_type, #{r.type}, route_color: #{r.color}, route_text_color: #{r.text_color}, route_url: #{r.url}, agency_id: #{r.agency_id}"
        # if city == "New York" && authority == "NYC Subway" && r.long_name == "Staten Island Railway"
        # end

        Route.find_or_create_by(
          city: city,
          authority: authority,
          long_name: r.long_name,
          short_name: r.short_name,
          route_id: r.id,
          route_type: r.type
        ) do |route|
          route.route_text_color = r.text_color unless r.text_color.blank?
          route.agency_id = r.agency_id unless r.agency_id.blank?
          route.route_url = r.url unless r.url.blank?
          route.route_color = r.color unless r.color.blank?
          route.description = r.desc unless r.desc.blank?
        end
      end #routes.each
    end #begin, rescue, else
  end #loc_data...each |agency|
end #sample.each
binding.pry
