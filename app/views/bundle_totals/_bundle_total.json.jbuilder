json.extract! bundle_total, :id, :bundle_quantity, :bundle_size, :bundle_cost, :line_item_id, :created_at, :updated_at
json.url bundle_total_url(bundle_total, format: :json)