desc "This task is called by the Heroku scheduler add-on"
task :update_person_count => :environment do
  puts "Updating person count for every bar..."
  DecrementAllBarPeopleCounts.decrementAll
  puts "done updating person count for every bar. Quitting..."
end
