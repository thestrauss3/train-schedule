Route.delete_all
source = GTFS::Source.build('http://www.mbta.com/uploadedfiles/MBTA_GTFS.zip')
routes = source.routes
routes.each do |r|
  route = Route.create(
    long_name: r.long_name,
    short_name: r.short_name,
    route_id: r.id,
    mode_name: r.desc,
    mode_id: r.type,
    color: r.color
  )
end
