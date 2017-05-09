class Api::V1::UsersController < ApiController
  def current_user_id
    @user = current_user
    render json: @user
  end
  
  def toggle_favorite_train_line
    @line = UserFavoriteLine.where(user: current_user, line_id: params[:line])
    if @line.empty?
      if params[:toggle] == "true"
        UserFavoriteLine.create(user: current_user, line_id: params[:line])
      end
      render json: true
    else
      if params[:toggle] == "true"
        UserFavoriteLine.where(user: current_user, line_id: params[:line])[0].delete
      end
      render json: false
    end
  end
end
