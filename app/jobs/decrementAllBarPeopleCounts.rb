class decrementAllBarPeopleCounts
  Bar.find_each do |bar|
    bar.people_count = bar.people_count/2
  end
end
