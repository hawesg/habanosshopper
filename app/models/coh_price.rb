class CohPrice < ApplicationRecord
  belongs_to :package
  has_many :coh_bcode

#  def as_json(options={})
#    super(:only => [],
#        :include => {
#          :employers => {:only => [:size,:package_type,:inch,:ring_guage,:bsize,:bcount,:multiplier, ]},
#          :roles => {:only => [:name]}
#        }
#    )
#  end  
  def cost_per_cigar
    (usd/package.total_count).round(2)
  end
  def usd
    price.round(2)
  end
end
