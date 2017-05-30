# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# TrainStop.delete_all
# Train.delete_all
# Station.delete_all
TrainLine.delete_all
# Time.zone = 'EST'
# # t = Time.zone.now.midnight.getlocal
# t = Time.new(2017, 1, 1, 0, 0, 0, -5)
#
# fram = TrainLine.create(name: "Framingham-Worcester line")
#
# t500 = Train.create(train_num: 500, train_line: fram, inbound: true)
# t502 = Train.create(train_num: 502, train_line: fram, inbound: true)
# t501 = Train.create(train_num: 501, train_line: fram, inbound: false)
# t581 = Train.create(train_num: 581, train_line: fram, inbound: false)
#
# worcester = Station.create(name: "Worcester", train_line: fram)
# west_natick = Station.create(name: "West Natick", train_line: fram, has_wifi: false)
# natick = Station.create(name: "Natick", train_line: fram, has_wifi: false)
# wellesley_square = Station.create(name: "Wellesley Square", train_line: fram, has_wifi: false)
# south_station = Station.create(name: "South Station", train_line: fram, has_wifi: true)
#
# TrainStop.create(train: t500, station: worcester, stop_time: t.change({ hour: 4, min: 45 }))
# TrainStop.create(train: t500, station: west_natick, stop_time: t.change({ hour: 5, min: 31 }))
# TrainStop.create(train: t500, station: natick, stop_time: t.change({ hour: 5, min: 36 }))
# TrainStop.create(train: t500, station: wellesley_square, stop_time: t.change({ hour: 5, min: 41 }))
# TrainStop.create(train: t500, station: south_station, stop_time: t.change({ hour: 6, min: 18 }))
#
# TrainStop.create(train: t502, station: worcester, stop_time: t.change({ hour: 5, min: 15 }))
# TrainStop.create(train: t502, station: west_natick, stop_time: t.change({ hour: 6, min: 01 }))
# TrainStop.create(train: t502, station: natick, stop_time: t.change({ hour: 6, min: 05 }))
# TrainStop.create(train: t502, station: south_station, stop_time: t.change({ hour: 6, min: 33 }))
#
#
# TrainStop.create(train: t501, station: south_station, stop_time: t.change({ hour: 4, min: 55 }))
# TrainStop.create(train: t501, station: west_natick, stop_time: t.change({ hour: 5, min: 24 }))
# TrainStop.create(train: t501, station: worcester, stop_time: t.change({ hour: 6, min: 06 }))
#
# TrainStop.create(train: t581, station: south_station, stop_time: t.change({ hour: 5, min: 00 }))
# TrainStop.create(train: t581, station: wellesley_square, stop_time: t.change({ hour: 5, min: 36 }))
# TrainStop.create(train: t581, station: natick, stop_time: t.change({ hour: 5, min: 40 }))
# TrainStop.create(train: t581, station: west_natick, stop_time: t.change({ hour: 5, min: 45 }))
scheduler = Rufus::Scheduler.new
# scheduler.every '1m' do
#   puts Time.now
# end
response = HTTParty.get('https://realtime.mbta.com/developer/api/v2/routes?api_key=RfQnjyQA7EecUcMOjtbp0Q&format=json')
routes = JSON.parse(response.body)["mode"]
routes.each do |mode|
  mode_name = mode["mode_name"]
  mode["route"].each do |route|
    TrainLine.create(mode: mode["mode_name"], name: route["route_name"], route_id: route["route_id"])
  end
end


binding.pry
