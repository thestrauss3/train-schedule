class Api::V1::TrainsController < ApiController
  def index
    train_line = TrainLine.find(params[:train_line_id])
    @trains = Train.where(train_line: train_line)
    render json: @trains
  end
end
