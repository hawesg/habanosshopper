class StagBcode < ApplicationRecord
  belongs_to :stag_price
  belongs_to :package
  has_one :vitola, through: :package
  def total_count
    package.bsize*package.bcount*package.multiplier
  end
  def ring_guage
    vitola.rg
  end
  def mm
    vitola.length
  end
  def inch
    (vitola.length * 0.039).round(2)
  end
  def marca
    vitola.marca
  end
  def size
    vitola.vitola
  end
  def package_type
    package.package_type
  end
  def bsize
    package.bsize
  end
  def bcount
    package.bcount
  end
  def multiplier
    package.multiplier
  end
  def usd
    stag_price.price.round(2)
  end
  def cost_per_cigar
    (usd/total_count).round(2)
  end
end
