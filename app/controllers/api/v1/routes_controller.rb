class Api::V1::RoutesController < ApiController
  def index
    routes = Routes.all
    render json: routes
  end

  # def show
  #   @route = Route.find(params[:id])
  #   render json: @route
  # end
end
