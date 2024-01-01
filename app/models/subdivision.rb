class Subdivision < ApplicationRecord

    has_many :users
    has_many :water_billing_transactions,  through: :users
    has_many :monthly_dues


    scope :all_users, -> { includes(:users) }
    
end
