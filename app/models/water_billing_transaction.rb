class WaterBillingTransaction < ApplicationRecord
    belongs_to :user
    belongs_to :water_billing
    belongs_to :subdivision
    has_many :addresses, through: :user
    has_one :balance, through: :user
    has_one :monthly_due_transaction, through: :user
   
    # Dito na ko
    after_update -> { WaterBillingTransactionRepository.after_update_callback(self) }


    scope :user_total_unpaid_bill, -> (user_id) do 
        joins(:monthly_due_transaction)
        .where(is_paid: [UN_PAID, PARTIAL], user_id: user_id)
        .select("
            water_billing_transactions.id,
            water_billing_transactions.user_id,
            water_billing_transactions.month,
            CASE 
                WHEN water_billing_transactions.is_paid='unpaid' THEN 
                COALESCE(monthly_due_transactions.amount,0) + COALESCE(water_billing_transactions.bill_amount,0)
                ELSE COALESCE(monthly_due_transactions.amount,0) + (COALESCE(water_billing_transactions.bill_amount,0) - COALESCE(water_billing_transactions.paid_amount,0)) 
            END as bal
                ")
        .distinct("water_billing_transactions.month")
    end

    
    scope :users_with_unpaid_bill, -> (user_id, month, year) do
        joins(:monthly_due_transaction)
        .where(is_paid: [UN_PAID, PARTIAL], user_id: user_id, month: ..month, year: year)
        .select("
            water_billing_transactions.id, 
            water_billing_transactions.user_id,
            water_billing_transactions.month,
            CASE 
                WHEN water_billing_transactions.is_paid='unpaid' THEN 
                COALESCE(monthly_due_transactions.amount,0) + COALESCE(water_billing_transactions.bill_amount,0)
                ELSE COALESCE(monthly_due_transactions.amount,0) + (COALESCE(water_billing_transactions.bill_amount,0) - COALESCE(water_billing_transactions.paid_amount,0)) 
            END as bal
                ")
        .distinct("water_billing_transactions.month")
    end

    PARTIAL = "partial"
    PAID = "paid"
    UN_PAID = "unpaid"
    STATUS = [UN_PAID, PAID, PARTIAL]

    
end
