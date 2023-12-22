class MonthlyDueRepository


    def self.get_monthly_due(subdivision_id)
        MonthlyDue.where(subdivision_id: subdivision_id, is_current: "true").first
    end
end