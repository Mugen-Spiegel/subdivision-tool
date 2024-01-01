class WaterBillingTransaction < ApplicationRecord
    belongs_to :user
    belongs_to :water_billing
    belongs_to :subdivision
    has_one :monthly_due_transaction, through: :user
   
    # Dito na ko
    after_update -> { WaterBillingAndMonthlyDueTransactionRepository.after_update_callback(self) }


    scope :user_total_unpaid_bill_, -> (user_id) do 
        joins(:monthly_due_transaction, :user, :subdivision )
        .where(is_paid: [UN_PAID, PARTIAL], user_id: user_id)
        .select("
            water_billing_transactions.id,
            CONCAT(users.first_name,' ', users.last_name) AS name,
            CONCAT('Block ', users.block, ' Lot ', users.lot, ' ', users.street, ' Street') AS address,
            water_billing_transactions.bill_amount,
            water_billing_transactions.current_reading,
            water_billing_transactions.previous_reading,
            water_billing_transactions.consumption,
            COALESCE(water_billing_transactions.bill_amount,0) AS basic_charge,
            COALESCE(monthly_due_transactions.amount,0) + COALESCE(water_billing_transactions.bill_amount,0) AS total_payable,
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

    scope :user_total_unpaid_bill, -> (user_id) do 
        joins(:monthly_due_transaction, :user, :subdivision )
        .where(is_paid: [UN_PAID, PARTIAL], user_id: user_id)
        .select("
            water_billing_transactions.id,
            water_billing_transactions.user_id,
            water_billing_transactions.month,
            SUM(CASE 
                WHEN water_billing_transactions.is_paid='unpaid' THEN 
                COALESCE(monthly_due_transactions.amount,0) + COALESCE(water_billing_transactions.bill_amount,0)
                ELSE COALESCE(monthly_due_transactions.amount,0) + (COALESCE(water_billing_transactions.bill_amount,0) - COALESCE(water_billing_transactions.paid_amount,0)) 
            END)as bal
                ")
        .group("water_billing_transactions.id")


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
