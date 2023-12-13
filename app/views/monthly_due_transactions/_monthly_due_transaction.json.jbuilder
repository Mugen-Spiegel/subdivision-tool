json.extract! monthly_due_transaction, :id, :user_id, :monthly_due_id, :subdivision_id, :is_paid, :created_at, :updated_at
json.url monthly_due_transaction_url(monthly_due_transaction, format: :json)
