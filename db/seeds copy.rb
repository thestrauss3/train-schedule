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
    feed_id = feed["id"]
    begin
      transit_feed_url = "https://api.transitfeeds.com/v1/getLatestFeedVersion?key=98729669-6e3a-4cb9-b68d-c89174e81af2&feed=#{feed_id.gsub('/', '%2F')}"
      source = GTFS::Source.build(transit_feed_url, strict: false)

    rescue GTFS::InvalidSourceException
      puts feed_id + " feed does not have a valid gtfs link"
      feeds_with_bad_links.push(feed_id)
    else
      feed_info = source.feed_infos[0]

      current_feed = Feed.find_or_create_by(
        feed_publisher_name: feed_info.publisher_name
      ) do |feed_model|
        feed_model.feed_publisher_url = feed_info.publisher_url
        feed_model.feed_lang = feed_info.lang
        feed_model.feed_start_date = feed_info.start_date unless feed_info.start_date.blank?
        feed_model.feed_end_date = feed_info.end_date unless feed_info.end_date.blank?
        feed_model.feed_version = feed_info.version unless feed_info.version.blank?
      end
      feed_id = current_feed.id

      if source.feed_infos.length > 1
        binding.pry
      end
      source.agencies.each do |a|
        Agency.find_or_create_by(
          feed_id: feed_id,
          agency_id: a.id
        ) do |agency|
          agency.agency_name = a.name
          agency.agency_url = a.url
          agency.agency_timezone = a.timezone
          agency.agency_lang = a.lang unless a.lang.blank?
          agency.agency_phone = a.phone unless a.phone.blank?
          agency.agency_fare_url = a.fare_url unless a.fare_url.blank?
          agency.agency_email = a.email unless a.email.blank?
        end
      end #agencies.each

      source.calendar_dates.each do |d|
        CalendarDate.find_or_create_by(
          feed_id: feed_id,
          service_id: d.service_id,
          date: d.date
        ) do |date|
          date.exception_type = d.exception_type
        end
      end

      source.calendars.each do |c|
        Calendar.find_or_create_by(
          feed_id: feed_id,
          service_id: c.service_id,
          start_date: c.start_date,
          end_date: c.end_date
        ) do |calendar|
          calendar.monday = c.monday
          calendar.tuesday = c.tuesday
          calendar.wednesday = c.wednesday
          calendar.thursday = c.thursday
          calendar.friday = c.friday
          calendar.saturday = c.saturday
          calendar.sunday = c.sunday
        end
      end

      source.fare_attributes.each do |fa|
        FareAttribute.find_or_create_by(
          feed_id: feed_id,
          fare_id: fa.fare_id
        ) do |fare_attribute|
          fare_attribute.price = fa.price
          fare_attribute.currency_type = fa.currency_type
          fare_attribute.payment_method = fa.payment_method
          fare_attribute.transfers = fa.transfers
          fare_attribute.transfer_duration = fa.transfer_duration
        end
      end

      source.fare_rules.each do |fr|
        FareRule.find_or_create_by(
          feed_id: feed_id,
          fare_id: fr.fare_id
        ) do |fare_rule|
          fare_rule.route_id = fr.route_id
          fare_rule.origin_id = fr.origin_id
          fare_rule.destination_id = fr.destination_id
          fare_rule.contains_id = fr.contains_id
        end
      end

      source.frequencies.each do |f|
        Frequency.find_or_create_by(
          feed_id: feed_id,
          trip_id: f.trip_id,
          start_time: f.start_time,
          end_time: f.end_time
        ) do |frequency|
          frequency.headway_secs = f.headway_secs
          frequency.exact_times = f.exact_times == 1
        end
      end

      source.routes.each do |r|
        Route.find_or_create_by(
          feed_id: feed_id,
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
      end

      source.shapes.each do |sh|
        Shape.find_or_create_by(
          feed_id: feed_id,
          shape_id: sh.id
        ) do |shape|
          shape.shape_pt_lat = sh.pt_lat
          shape.shape_pt_lon = sh.pt_lon
          shape.shape_pt_sequence = sh.pt_sequence
          shape.shape_dist_traveled = sh.dist_traveled
        end
      end

      source.stops_times.each do |st|
        StopTime.find_or_create_by(
          feed_id: feed_id,
          trip_id: st.trip_id,
          stop_id: st.stop_id
        ) do |stop_time|
          stop_time.arrival_time = st.arrival_time
          stop_time.departure_time = st.departure_time
          stop_time.stop_sequence = st.stop_sequence
          stop_time.stop_headsign = st.stop_headsign
          stop_time.pickup_type = st.pickup_type
          stop_time.drop_off_type = st.drop_off_type
          stop_time.shape_dist_traveled = st.shape_dist_traveled
          stop_time.timepoint = st.timepoint
        end
      end

      source.stops.each do |s|
        Stop.find_or_create_by(
          feed_id: feed_id,
          stop_id: s.id
        ) do |stop|
          stop.stop_code = s.code
          stop.stop_name = s.name
          stop.stop_desc = s.desc
          stop.stop_lat = s.lat
          stop.stop_lon = s.lon
          stop.zone_id = s.zone_id
          stop.stop_url = s.url
          stop.location_type = s.location_type
          stop.parent_station = s.parent_station
          stop.stop_timezone = s.timezone
          stop.wheelchair_boarding = s.wheelchair_boarding
        end
      end

      source.transfers.each do |tx|
        Tranfer.find_or_create_by(
          feed_id: feed_id,
          from_stop_id: tx.from_stop_id,
          to_stop_id: tx.to_stop_id,
          transfer_type: tx.type,
          min_transfer_time: tx.min_transfer_time
        )
      end

      source.trips.each do |t|
        Trip.find_or_create_by(
          feed_id: feed_id,
          trip_id: t.id
        ) do |trip|
          trip.route_id = t.route_id
          trip.service_id = t.service_id
          trip.trip_headsign = t.headsign unless t.headsign.blank?
          trip.trip_short_name = t.short_name unless t.short_name.blank?
          trip.direction_id = t.direction_id
          trip.block_id = t.block_id unless t.block_id.blank?
          trip.shape_id = t.shape_id unless t.shape_id.blank?
          trip.wheelchair_accessible = t.wheelchair_accessible unless t.wheelchair_accessible.blank?
          trip.bikes_allowed = t.bikes_allowed unless t.bikes_allowed.blank?
        end
      end

    end #begin, rescue, else
  end #loc_data...each |agency|
end #sample.each

binding.pry
