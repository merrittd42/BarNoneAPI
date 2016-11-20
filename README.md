A demo project API for a React.JS native mobile application. This will fetch all nearby bars in the future utilizing the Google Places API, but works with dummy data now due to time constraints.

API:
get 'bars' - Provide two parameters, "latitude" and "longitude" and this will return every bar within 5 miles of this location stored in the database.

post 'bars/review/:id' - Provide 3 parameters, "rating", "crowdedness", and "loudness" update the judgement metrics of the bar under id in the database.

post 'bars/update-count' - Provide 3 parameters, "people_count", "latitude", and "longitude" to update the number of the people at the bar in the specified coordinates.
