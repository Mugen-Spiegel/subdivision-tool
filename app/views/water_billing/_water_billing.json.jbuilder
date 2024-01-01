json.extract! water_billing, :id, :per_cubic_price, :is_current_price, :subdivision_id, :created_at, :updated_at
json.url water_billing_url(water_billing, format: :json)
