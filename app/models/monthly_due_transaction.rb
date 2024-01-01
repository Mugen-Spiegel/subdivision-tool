class MonthlyDueTransaction < ApplicationRecord

    belongs_to :user
    belongs_to :subdivision
    has_one :monthly_due_transaction, through: :user
    
    PARTIAL = "partial"
    PAID = "paid"
    UN_PAID = "unpaid"
    STATUS = [UN_PAID, PAID, PARTIAL]

    validates :is_paid, :amount, :user_id, :year, :month, :monthly_due_id, presence: true

end
