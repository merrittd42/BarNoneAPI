class BarController < ApplicationController
  def index
    begin
      latitude = latitude_and_longitude[0].to_d
      longitude = latitude_and_longitude[1].to_d

      bars = Bar.where(
      "latitude >= :latitudeLow AND latitude <= :latitudeHigh AND longitude >= :longitudeLow AND longitude <= :longitudeHigh",
      {latitudeLow: latitude - 0.0072, latitudeHigh: latitude + 0.0072, longitudeLow: longitude - 0.0072, longitudeHigh: longitude + 0.0072}

      )

      render json: {bars: bars}

    rescue Exception => e
      print 'ERROR'
      puts e
      render json: { bars: []}
    end
  end

  private

  def latitude_and_longitude
    params.require([:latitude, :longitude])
  end
end
