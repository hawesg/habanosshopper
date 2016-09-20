json.extract! stag_bcode, :id, :stagID, :name, :bcode, :stag_price_id, :created_at, :updated_at
json.url stag_bcode_url(stag_bcode, format: :json)