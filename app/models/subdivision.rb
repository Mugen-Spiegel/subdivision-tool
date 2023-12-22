class Subdivision < ApplicationRecord

    has_many :users
    has_many :addresses, through: :users
    has_many :water_billing_transactions, -> { order('month desc').limit(1) }, through: :users
    has_many :monthly_dues


    scope :all_users, -> { includes(:users) }
    scope :all_users_with_latest_transactions, -> { 
        left_joins(:water_billing_transactions, :users)
        .select("DISTINCT(water_billing_transactions.id) AS transaction_id,
            users.id AS user_id, 
            users.subdivision_id AS subdivision_id, 
            water_billing_transactions.current_reading AS current_reading")
    }
end
