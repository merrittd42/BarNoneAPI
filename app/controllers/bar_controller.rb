class BarController < ApplicationController
  def index
    begin
      latitude = latitude_and_longitude[0].to_d
      longitude = latitude_and_longitude[1].to_d

      #googleBarMap = map_fetch(latitude, longitude)

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

  def updateRating

    begin

      barRating = params[:rating].to_i
      barCrowdedness = params[:crowdedness].to_i
      barLoudness = params[:loudness].to_i
      barID = params[:id].to_i

      barToChange = Bar.find(barID)
      newCrowdedness = (barToChange.crowdedness*barToChange.crowdedness_count) + barCrowdedness
      barToChange.crowdedness_count +=1
      barToChange.update(crowdedness: newCrowdedness/barToChange.crowdedness_count)
      newRating = (barToChange.rating*barToChange.rating_count) + barRating
      barToChange.rating_count+=1
      barToChange.update(rating: newRating/barToChange.rating_count)
      newLoudness = (barToChange.loudness*barToChange.loudness_count) + barLoudness
      barToChange.loudness_count +=1
      barToChange.update(loudness: newLoudness/barToChange.loudness_count)
      puts barToChange.to_s
      barToChange.save
    rescue => e
      print 'ERROR'
      puts e
      render json: { bars: []}
    end
  end

  def updateCount
 #0.1 miles is 0.001140 lat/long units
    begin

      latitude = params[:latitude].to_d
      longitude = params[:longitude].to_d

      bars = Bar.where(
      "latitude >= :latitudeLow AND latitude <= :latitudeHigh AND longitude >= :longitudeLow AND longitude <= :longitudeHigh",
      {latitudeLow: latitude - 0.00057, latitudeHigh: latitude + 0.00057, longitudeLow: longitude - 0.00057, longitudeHigh: longitude + 0.00057}

      )


      bars.each do |t|
        t.person_count  += 1
        t.save
      end

    rescue => e
      print 'ERROR'
      puts e
      render json: { bars: []}
    end
  end


  private

  def latitude_and_longitude
    params.require([:latitude, :longitude])
  end

  def map_fetch(lat, lng)
    # wowie api key here dnt steel pls

    @client = GooglePlaces::Client.new(
      "AIzaSyDDQRzU5pfLquWI8oDOHT0FLfsyt8Z0Vpw")

    spots = @client.spots(lat, lng, 8046.72,
      :types => 'bar')
    return spots
  end

end
