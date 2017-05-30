desc 'do something'
task do_something: :environment do
  puts "hiiiiiiiii"
  TrainLine.create(name: "new train", mode: "commuter", route_id: "train1")
end
