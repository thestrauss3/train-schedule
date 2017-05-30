class Api::V1::UsersController < ApiController
  def current_user_id
    @user = current_user
    render json: @user
  end

  def toggle_favorite_route
    route = UserFavoriteRoute.where(user: current_user, route_id: params[:route])
    toggle = str_to_boolean(params[:toggle])
    if route.empty?
      favorite_route = false
      if toggle
        UserFavoriteRoute.create(user: current_user, route_id: params[:route])
        favorite_route = true
      end
    else
      favorite_route = true
      if toggle
        route[0].delete
        favorite_route = false
      end
    end
    render json: favorite_route
  end

  def toggle_favorite_train
    train = UserFavoriteTrain.where(
      user: current_user,
      train_num: params[:train],
      route_id: params[:route]
    )
    toggle = str_to_boolean(params[:toggle])
    if train.empty?
      favorite_train = false
      if toggle
        UserFavoriteTrain.create(
          route_id: params[:route],
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
      route_id: params[:route]
    )
    toggle = str_to_boolean(params[:toggle])
    if station.empty?
      favorite_station = false
      if toggle
        UserFavoriteStation.create(
          route_id: params[:route],
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
