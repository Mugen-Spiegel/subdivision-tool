class WaterBillingRepository
    
    attr_accessor :params, :subdivision, :last_transaction, :consumption

    def initialize(params)
        self.params = params
    end

    def get_all
        WaterBilling.where(subdivision_id: self.params["id"]).select(
            :month,
            :mother_meter_current_reading,
            :mother_meter_previous_reading,
            :consumption,
            :is_paid,
            :bill_amount,
            :per_cubic_price,
            :paid_amount,
            :meter_image_link,
            :reciept_image_link
        )
    end

    def create
        get_all_residence
        ids_count = get_all_id.count
        get_last_bill
        puts ids_count, "assasasadsda"
        WaterBilling.create(
            month: Date::MONTHNAMES.index(self.params["month"]),
            year: self.params["year"],
            mother_meter_current_reading: self.params["mother_meter_current_reading"],
            mother_meter_previous_reading: self.last_transaction&.mother_meter_current_reading || 0,
            consumption: current_consumption,
            is_paid: WaterBilling::UN_PAID,
            per_cubic_price: price_per_cubic(ids_count).round(2),
            meter_image_link: self.params["meter_image_link"],
            subdivision_id: self.params["subdivision_id"],
        )
    end

    def get_all_residence
        self.subdivision = Subdivision.all_users.find(self.params["subdivision_id"])
    end

    def get_all_id
        self.subdivision.users.pluck(:id)
    end

    def get_last_bill
        self.last_transaction = WaterBilling.where(subdivision_id: self.params["subdivision_id"])&.last
    end

    def price_per_cubic(ids_count)
        current_consumption / ids_count
    end

    def current_consumption
        self.params["mother_meter_current_reading"].to_f - (self.last_transaction&.mother_meter_current_reading || 0)
    end
end