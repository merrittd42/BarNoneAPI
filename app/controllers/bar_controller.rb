class BarController < ApplicationController
  def index
    cords = latitude_and_longitude
  end

  private

  def latitude_and_longitude
    params.require(:latitude, :longitude)
  end
end
