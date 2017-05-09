class Api::V1::UsersController < ApiController
  def current_user_id
    @user = current_user
    render json: @user
  end

  def toggle_favorite_train_line
    line = UserFavoriteLine.where(user: current_user, line_id: params[:line])
    if line.empty?
      if params[:toggle] == "true"
        UserFavoriteLine.create(user: current_user, line_id: params[:line])
        favorite_line = true
      end
      favorite_line = false
    else
      if params[:toggle] == "true"
        UserFavoriteLine.where(user: current_user, line_id: params[:line])[0].delete
        favorite_line = false
      end
      favorite_line = true
    end
    render json: favorite_line
  end

  def toggle_favorite_train
    train = UserFavoriteTrain.where(user: current_user, train_id: params[:train])
    if train.empty?
      if params[:toggle] == "true"
        UserFavoriteTrain.create(user: current_user, train_id: params[:train])
        favorite_train = true
      end
      favorite_train = false
    else
      if params[:toggle] == "true"
        UserFavoriteTrain.where(user: current_user, train_id: params[:train])[0].delete
        favorite_train = false
      end
      favorite_train = true
    end
    render json: favorite_train
  end

  def toggle_favorite_station
    @station = UserFavoriteStation.where(user: current_user, station_id: params[:station])
    if @station.empty?
      if params[:toggle] == "true"
        UserFavoriteStation.create(user: current_user, station_id: params[:station])
        favorite_station = true
      end
      favorite_station = false
    else
      if params[:toggle] == "true"
        UserFavoriteStation.where(user: current_user, station_id: params[:station])[0].delete
        favorite_station = false
      end
      favorite_station = true
    end
    render json: favorite_station
  end
end
