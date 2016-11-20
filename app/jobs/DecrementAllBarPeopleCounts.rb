class DecrementAllBarPeopleCounts


  def decrementAll
    Bar.find_each do |bar|
      bar.people_count = bar.people_count/2
      bar.save
    end
  end
end
