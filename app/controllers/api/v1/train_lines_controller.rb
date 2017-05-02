class Api::V1::TrainLinesController < ApiController
  def index
    lines = TrainLine.all
    render json: lines
  end
  def show
    @line = TrainLine.find(params[:id])
    render json: @line
  end
end
