class User < ApplicationRecord
    has_one :address
    belongs_to :subdivision
    has_many :water_billing_transaction
end
