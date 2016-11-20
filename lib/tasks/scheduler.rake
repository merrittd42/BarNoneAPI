desc "This task is called by the Heroku scheduler add-on"
task :update_person_count => :environment do
  puts "Updating person count for every bar..."
  Bar.find_each do |bar|
    bar.people_count = bar.people_count/2
    bar.save
  end
  puts "done updating person count for every bar. Quitting..."
end
