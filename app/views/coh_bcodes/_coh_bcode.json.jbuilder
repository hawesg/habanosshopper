json.extract! coh_bcode, :id, :name, :bcode, :coh_price_id, :created_at, :updated_at
json.url coh_bcode_url(coh_bcode, format: :json)