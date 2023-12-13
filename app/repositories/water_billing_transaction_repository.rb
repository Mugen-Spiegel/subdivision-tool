class WaterBillingTransactionRepository

    attr_accessor :year, :month, :name, :subdivision_id, :first_name, :last_name,  :created_at, :sort_column, :direction, :where_clause
    
    def initialize(params)
        self.year = params["year"] || Time.now.year
        self.month = params["month"] || Date::MONTHNAMES[Time.now.month]
        self.first_name = params["first_name"] || ""
        self.last_name = params["last_name"] || ""
        self.subdivision_id = params["subdivision_id"]
        self.sort_column = params["sort_column"]
        self.direction = params["direction"]
        self.where_clause = {}
    end

    def search_water_billing_transaction
        puts Time.mktime(self.year, Date::MONTHNAMES.find_index(self.month))..Time.mktime(self.year, Date::MONTHNAMES.find_index(self.month)).end_of_month
        self.where_clause = unless self.month.nil?
            {created_at: Time.mktime(self.year, Date::MONTHNAMES.find_index(self.month))..Time.mktime(self.year, Date::MONTHNAMES.find_index(self.month)).end_of_month}
        else
            {created_at: Time.mktime(self.year, 1)..Time.mktime(self.year, 12)}
        end

        unless self.first_name.empty?
            self.where_clause["users.first_name"] = self.first_name
        end

        unless self.last_name.empty?
            self.where_clause["users.last_name"] = self.last_name
        end
        WaterBillingTransaction.joins(:user, :water_billing)
        .select("water_billing_transactions.created_at AS created_at,
            CONCAT(users.first_name,' ', users.last_name) AS name,
            CAST(water_billing_transactions.current_reading AS int) AS current_reading,
            CAST(water_billing_transactions.previous_reading AS int) AS previous_reading,
            CAST(water_billings.per_cubic_price AS int) AS per_cubic_price,
            (water_billing_transactions.current_reading - water_billing_transactions.previous_reading) *water_billings.per_cubic_price bill_amount
        ")
        .where(self.where_clause)
        .order("#{self.sort_column} #{self.direction}")
    end
    
end