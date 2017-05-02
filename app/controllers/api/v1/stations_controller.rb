class Api::V1::StationsController < ApiController
  def index
    line = TrainLine.find(params[:train_line_id])
    @stations = Station.where(train_line: line)
    render json: @stations
  end
end
