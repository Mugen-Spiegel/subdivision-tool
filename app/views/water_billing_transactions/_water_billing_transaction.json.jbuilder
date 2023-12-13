json.extract! water_billing_transaction, :id, :current_reading, :previous_reading, :user_id, :subdivision_id, :water_billing_id, :created_at, :updated_at
json.url water_billing_transaction_url(water_billing_transaction, format: :json)
