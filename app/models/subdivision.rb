class Subdivision < ApplicationRecord

    has_many :users
    scope :all_users, -> { includes(:user) }

end
