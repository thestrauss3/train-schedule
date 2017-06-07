# transitfeeds #getLocations
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
sample = [boston]

Route.delete_all
feeds_with_bad_links = []
sample.each do |loc|
  id = loc["id"]
  # transit feeds: #getFeeds
  response = HTTParty.get("https://api.transitfeeds.com/v1/getFeeds?key=98729669-6e3a-4cb9-b68d-c89174e81af2&location=#{id}&descendants=1&page=1&limit=500&type=gtfs")
  loc_data = JSON.parse(response.body)
  loc_data["results"]["feeds"].each do |feed|
    # binding.pry
    feed_id = feed["id"]
    location = feed["l"]["t"]
    city = feed["l"]["n"]
    authority = feed["t"].chomp("GTFS").strip
    begin
      transit_feed_url = "https://api.transitfeeds.com/v1/getLatestFeedVersion?key=98729669-6e3a-4cb9-b68d-c89174e81af2&feed=#{feed_id.gsub('/', '%2F')}"
      source = GTFS::Source.build(transit_feed_url, strict: false)

    rescue GTFS::InvalidSourceException
      puts feed_id + " feed does not have a valid gtfs link"
      feeds_with_bad_links.push(feed_id)
    else
      feed_info = source.feed_infos[0]
      binding.pry

      current_feed = Feed.find_or_create_by(
        feed_publisher_name: feed_info.publisher_name
      ) do |feed|
        feed.feed_publisher_url = feed_info.publisher_url
        feed.feed_lang = feed_info.lang
        feed.feed_start_date = feed_info.start_date
        feed.feed_end_date = feed_info.end_date
        feed.feed_version = feed_info.version
      end
      feed_id = current_feed.id
      binding.pry
      if source.feed_infos.length > 1
        binding.pry
      end

      source.routes.each do |r|
        Route.find_or_create_by(
          city: city,
          authority: authority,
          route_id: r.id
        ) do |route|
          route.route_long_name = r.long_name ? r.long_name : ""
          route.route_short_name = r.short_name ? r.short_name : ""
          route.route_type = r.type
          route.route_text_color = r.text_color unless r.text_color.blank?
          route.agency_id = r.agency_id unless r.agency_id.blank?
          route.route_url = r.url unless r.url.blank?
          route.route_color = r.color unless r.color.blank?
          route.description = r.desc unless r.desc.blank?
        end
      end #routes.each

      # agencies = source.agencies
      # binding.pry
      # agencies.each do |a|
      #   Agency.find_or_create_by(
      #     city: city,
      #     authority: authority
      #   ) do |agency|
      #
      #   end
      # end #agencies.each
    end #begin, rescue, else
  end #loc_data...each |agency|
end #sample.each

binding.pry
