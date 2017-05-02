class Api::V1::TrainLinesController < ApiController
  def show
    @line = TrainLine.find(params[:id])
    render json: @line
  end
end
