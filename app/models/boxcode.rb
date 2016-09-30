class Boxcode < ApplicationRecord
  belongs_to :package
  has_one :vitola, through: :package
  has_many :prices, through: :package
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
  def total_count
    bsize*bcount*multiplier
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
  def tubo
    package.tubo
  end
end
