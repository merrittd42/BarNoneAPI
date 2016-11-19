class BarController < ApplicationController
  def index
    cords = latitude_and_longitude
    userLat = cords[0]
    userLong = cords[1]
    bars = Hash.new
    bars[:latitude] = userLat

    render json: bars
  end

  private

  def latitude_and_longitude
    params.require([:latitude, :longitude])
  end
end
