class Package < ApplicationRecord
  belongs_to :vitola
  #has_one :cigars_of_habanos_price
  #has_one :i_havanas_price
  #has_one :lewis_stagnetto_price
  #has_many :coh_bcode
  #has_many :stag_bcode
  has_many :boxcodes
  has_many :prices
  scope :availible, -> { joins(:prices).uniq }
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
  def minimum_price
    prices.min_by { |x| x.price }
  end
  def is_min? (type)
    minimum_price.type == type
  end
  #def ring_guage
  #  self.
  #end
end
