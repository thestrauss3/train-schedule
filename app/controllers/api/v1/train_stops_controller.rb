class Api::V1::TrainStopsController < ApiController
  def index
    stop = TrainStop.where(station: params[:station_id], train: params[:train_id])[0]
    stop_time = stop.stop_time.strftime("%H:%M")
    stop_time = stop_time.to_json
    render json: stop_time
  end
end
