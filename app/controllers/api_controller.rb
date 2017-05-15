class ApiController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  skip_before_filter :verify_authenticity_token
  protect_from_forgery with: :null_session

  def str_to_boolean(str)
    if str.to_s === "true"
      true
    elsif str.to_s === "false"
      false
    end
  end
end
