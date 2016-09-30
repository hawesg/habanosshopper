json.data do
  json.array! @prices do |package|
    json.marca package.marca.titleize
    json.vitola package.size.titleize
    json.boxtype human_readable_box_type(package.package_type)
    json.mm package.mm
    json.rg package.ring_guage
    json.tubo package.tubo
    json.bsize package.bsize
    json.bcount package.bcount
    json.multiplier package.multiplier
    json.set! :prices do
      package.prices.each do |vendor|
        json.set! vendor.vendor_name do
          json.price humanized_money vendor.price
          json.cost_per_cigar humanized_money vendor.cost_per_cigar
          json.is_min vendor.is_min?
        end
      end
    end
  end
end
