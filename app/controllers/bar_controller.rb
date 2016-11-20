class BarController < ApplicationController
  def index
    begin
      latitude = latitude_and_longitude[0].to_f
      longitude = latitude_and_longitude[1].to_f

      bars = Bar.where(
      "latitude >= :latitudeLow AND latitude <= :latitudeHigh AND longitude >= :longitudeLow AND longitude <= :longitudeHigh",
      {latitudeLow: latitude - 0.0005, latitudeHigh: latitude + 0.0005, longitudeLow: longitude - 0.0005, longitudeHigh: longitude + 0.0005}

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
