class Subdivision < ApplicationRecord

    has_many :users
    has_many :addresses, through: :users
    has_many :water_billing_transactions,  through: :users
    has_many :monthly_dues


    scope :all_users, -> { includes(:users) }
    scope :all_users_with_latest_transactions, ->(year, month) { 
        if month > 1
            month -= 1
        end
        puts month, "asdsa"
        left_joins(:water_billing_transactions, :users)
        .where("water_billing_transactions.year": year, "water_billing_transactions.month": month)
        .select("DISTINCT(water_billing_transactions.id) AS transaction_id,
            users.id AS user_id, 
            water_billing_transactions.year as year,
            water_billing_transactions.month as month,
            users.subdivision_id AS subdivision_id, 
            water_billing_transactions.current_reading AS current_reading")
    }
end
