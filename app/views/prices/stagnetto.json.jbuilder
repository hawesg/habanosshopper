json.data do
  json.array! @prices do |package|
    json.marca package.marca.titleize
    json.vitola package.size.titleize
    json.boxtype human_readable_box_type(package.package_type)
    json.mm package.mm
    json.rg package.ring_guage
    json.bsize package.bsize
    json.tubo package.tubo
    json.bcount package.bcount
    json.multiplier package.multiplier
    json.price do
      json.price humanized_money package.prices.first.price
      json.cost_per_cigar humanized_money package.prices.first.cost_per_cigar
    end
  end
end
