class Price < ApplicationRecord
  monetize :price_cents
  has_one :package
  #scope :CigarsOfHabanos, -> { where(type: 'CigarsOfHabanosPrice') }
  #scope :IHavanasPrice, -> { where(type: 'IHavanasPrice') }
  #scope :LewisStagnettoPrice, -> { where(type: 'LewisStagnettoPrice') }
  #delegate :CigarsOfHabanos, :IHavanasPrice, :LewisStagnettoPrice, to: :packages
  #delegate
  def cost_per_cigar
    price/package.total_count
  end
  def is_min?
    package.minimum_price.type == type
  end
  def vendor_name
    type.sub 'Price', ''
  end
#  def price
#    Money.new price_cents, price_currency
#  end

#  def price=(value)
#    value = Money.parse(value) if value.instance_of? String  # otherwise assume, that value is a Money object

#    write_attribute :price_cents,    value.cents
#    write_attribute :price_currency, value.currency_as_string
#  end
end


#CohPrice.all do |x|
#  y = CigarsOfHabanosPrice.new
#  y.name = x.name
#  y.price = x.price
#  y.package = x.package
#  y.save!
#end
