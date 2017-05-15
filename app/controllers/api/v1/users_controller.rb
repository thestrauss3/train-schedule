class Api::V1::UsersController < ApiController
  def current_user_id
    @user = current_user
    render json: @user
  end

  def toggle_favorite_train_line
    line = UserFavoriteLine.where(user: current_user, line_id: params[:line])
    toggle = str_to_boolean(params[:toggle])
    if line.empty?
      favorite_line = false
      if toggle
        UserFavoriteLine.create(user: current_user, line_id: params[:line])
        favorite_line = true
      end
    else
      favorite_line = true
      if toggle
        line[0].delete
        favorite_line = false
      end
    end
    render json: favorite_line
  end

  def toggle_favorite_train
    train = UserFavoriteTrain.where(
      user: current_user,
      train_num: params[:train],
      line_id: params[:line]
    )
    toggle = str_to_boolean(params[:toggle])
    if train.empty?
      favorite_train = false
      if toggle
        UserFavoriteTrain.create(
          line_id: params[:line],
          user: current_user,
          train_num: params[:train]
        )
        favorite_train = true
      end
    else
      favorite_train = true
      if toggle
        train[0].delete
        favorite_train = false
      end
    end
    render json: favorite_train
  end

  def toggle_favorite_station
    station = UserFavoriteStation.where(
      user: current_user,
      station_id: params[:station],
      line_id: params[:line]
    )
    toggle = str_to_boolean(params[:toggle])
    if station.empty?
      favorite_station = false
      if toggle
        UserFavoriteStation.create(
        line_id: params[:line],
          user: current_user,
          station_id: params[:station]
        )
        favorite_station = true
      end
    else
      favorite_station = true
      if toggle
        UserFavoriteStation.where(user: current_user, station_id: params[:station])[0].delete
        favorite_station = false
      end
    end
    render json: favorite_station
  end
end
