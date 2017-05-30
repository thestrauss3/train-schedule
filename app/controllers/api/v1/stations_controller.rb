class Api::V1::StationsController < ApiController
  def index
    route = Route.find(params[:train_line_id])
    @stations = Station.where(train_line: line)
    render json: @stations
  end
end
