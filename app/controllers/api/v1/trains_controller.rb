class Api::V1::TrainsController < ApiController
  def index
    route = Route.find(params[:route_id])
    @trains = Train.where(route: route)
    render json: @trains
  end
end
