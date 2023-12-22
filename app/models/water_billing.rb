class WaterBilling < ApplicationRecord

    has_many :water_billing_transactions, dependent: :destroy
    validates :month, presence: true
    validates :year, presence: true
    validates :mother_meter_current_reading, presence: true
    
    belongs_to :subdivision

    after_save -> { WaterBillingTransactionRepository.after_create_callback(self) }
    
    PARTIAL = "partial"
    PAID = "paid"
    UN_PAID = "unpaid"
    STATUS = [UN_PAID, PAID, PARTIAL]
end
