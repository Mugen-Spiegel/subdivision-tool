class User < ApplicationRecord
    has_one :address
    belongs_to :subdivision
    has_one :balance
    has_many :water_billing_transactions
    has_many :monthly_due_transaction
end
