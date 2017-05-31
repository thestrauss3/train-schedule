# scheduler = Rufus::Scheduler.new
# scheduler.every '1m' do
#   puts Time.now
# end

## Get all Routes
# Route.delete_all
# response = HTTParty.get('https://realtime.mbta.com/developer/api/v2/routes?api_key=RfQnjyQA7EecUcMOjtbp0Q&format=json')
# routes = JSON.parse(response.body)["mode"]
# routes.each do |mode|
#   mode["route"].each do |route|
#     binding.pry
#     Route.create(name: route["route_name"], route_id: route["route_id"], mode_name: mode["mode_name"], mode_id: mode["route_type"], route_hide: route["route_hide"])
#   end
# end

# ## Get all Stations for each Route
# Station.delete_all
# Route.all.each do |r|
#   route_id = r[:route_id]
#   route_name = r[:name]
#   response = HTTParty.get("http://realtime.mbta.com/developer/api/v2/stopsbyroute?api_key=RfQnjyQA7EecUcMOjtbp0Q&route=#{route_id}")
#   all_stations = JSON.parse(response.body)["direction"]
#   all_stations.each do |direction|
#     direction_id = direction["direction_id"]
#     direction_name = direction["direction_name"]
#     direction["stop"].each do |station|
#       stop_order = station["stop_order"]
#       stop_id = station["stop_id"]
#       stop_name = station["stop_name"]
#       parent_stop_id = station["parent_station"]
#       parent_stop_name = station["parent_station_name"]
#       stop_lat = station["stop_lat"]
#       stop_lon = station["stop_lon"]
#       station = Station.create(stop_order: stop_order, stop_id: stop_id, stop_name: stop_name, parent_stop_id: parent_stop_id, parent_stop_name: parent_stop_name, stop_lat: stop_lat, stop_lon: stop_lon, direction_id: direction_id, direction_name: direction_name, route_id: route_id, route_name: route_name)
#     end
#   end
# end

## Get all Trains for each Route
# Train.delete_all
# Route.all.each do |r|
#   route_id = r[:route_id]
# end
# ids = Route.all.pluck(:route_id).join(',')
# response = HTTParty.get("http://realtime.mbta.com/developer/api/v2/schedulebyroutes?api_key=RfQnjyQA7EecUcMOjtbp0Q&routes=#{ids}")
# data = (JSON.parse(response.body))["mode"]
# binding.pry
