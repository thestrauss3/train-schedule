class Api::V1::TrainsController < ApiController
  def index
    line = TrainLine.find(params[:train_line_id])
    @trains = Train.where(train_line: line)
    render json: @trains
  end
end
