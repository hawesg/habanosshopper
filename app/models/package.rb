class Package < ApplicationRecord
  belongs_to :vitola
  has_one :coh_price
  has_one :ih_price
  has_one :stag_price
  has_many :coh_bcode
  has_many :stag_bcode
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
    price = []
    if coh_price
      price << coh_price.usd
    end
    if ih_price
      price << ih_price.usd
    end
    if stag_price
      price << stag_price.usd
    end
    price.min
  end
  #def ring_guage
  #  self.
  #end
end
