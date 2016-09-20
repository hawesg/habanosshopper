class StagPrice < ApplicationRecord
  belongs_to :package
  has_many :stag_bcode
  def cost_per_cigar
    (usd/self.package.total_count).round(2)
  end
  def usd
    (price*1.31).round(2)
  end
end
