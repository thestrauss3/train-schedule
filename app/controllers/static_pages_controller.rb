class StaticPagesController < ApplicationController
  def home
    redirect_to train_lines_path
  end
end
