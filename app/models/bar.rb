class Bar < ApplicationRecord
  has_many :comments

  def halveAll
    Bar.each do |t|
      t.person_count = t.person_count/2
    end
  end
end
