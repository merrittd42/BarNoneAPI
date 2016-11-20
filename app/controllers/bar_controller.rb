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

  def updateReview

    begin

      barRating = params[:rating].to_i
      barCrowdedness = params[:crowdedness].to_i
      barLoudness = params[:loudness].to_i
      barID = params[:id].to_i

      barToChange = Bar.find(barID)
      newCrowdedness = barToChange.crowdedness + barCrowdedness
      barToChange.crowdedness_count +=1
      barToChange.crowdedness = newCrowdedness/barToChange.crowdedness_count
      newRating = barRating + barToChange.rating
      barToChange.rating_count+=1
      barToChange.rating = newRating/barToChange.rating_count
      barToChange.loudness = barLoudness
      newLoudness = barToChange.loudness + barLoudness
      barToChange.loudness_count +=1
      barToChange.loudness = newLoudness/barToChange.loudness_count

    rescue
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

    rescue
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
