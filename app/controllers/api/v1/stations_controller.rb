class Api::V1::StationsController < ApiController
  def index
    route = Route.find(params[:route_id])
    @stations = Station.where(route: route)
    render json: @stations
  end
end
