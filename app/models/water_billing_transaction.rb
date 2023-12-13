class WaterBillingTransaction < ApplicationRecord
    belongs_to :user
    belongs_to :water_billing

    ransacker :created_at do
        Arel.sql('date(created_at)')
    end
end
