class Vitola < ApplicationRecord
  has_many :package
  def total_count
    bsize*bcount*multiplier
  end  
end
