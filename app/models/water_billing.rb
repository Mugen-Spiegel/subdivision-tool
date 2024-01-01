class WaterBilling < ApplicationRecord

    has_many :photos, dependent: :destroy
    
    accepts_nested_attributes_for :photos, allow_destroy: true

    has_many :water_billing_transactions, dependent: :destroy
    validates :month, presence: true
    validates :year, presence: true
    validates :mother_meter_current_reading, presence: true
    
    belongs_to :subdivision

    after_create -> { WaterBillingAndMonthlyDueTransactionRepository.after_create_callback(self) }
    before_update -> do
        if self.paid_amount == self.bill_amount
            self.is_paid = PAID
        elsif self.paid_amount > 0
            self.is_paid = PARTIAL
        elsif self.paid_amount == 0
            self.is_paid = UN_PAID
        end
    end
    PARTIAL = "partial"
    PAID = "paid"
    UN_PAID = "unpaid"
    STATUS = [UN_PAID, PAID, PARTIAL]
end
