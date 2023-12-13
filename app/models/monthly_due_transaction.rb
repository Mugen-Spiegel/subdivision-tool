class MonthlyDueTransaction < ApplicationRecord

    belongs_to :user
    belongs_to :subdivision
    belongs_to :monthly_due
end
