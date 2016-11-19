class BarController < ApplicationController
  def index

    latitude = latitude_and_longitude[0].to_f
    longitude = latitude_and_longitude[1].to_f

    render json: {
      bars: Bar.where (
        latitude: [latitude - 1, latitude + 1],
        longitude: [longitude - 1, longitude + 1]
        )
    }

  end

  private

  def latitude_and_longitude
    params.require([:latitude, :longitude])
  end
end
