module ApplicationHelper
    include Pagy::Frontend

    def sort_link(column:, label:)
        if column == params[:column]
            link_to(label, water_billing_transaction_subdivision_path(column: column, direction: next_direction), {:style=>'text-decoration: none; color: white;'})
          else
            link_to(label, water_billing_transaction_subdivision_path(column: column, direction: 'asc'), {:style=>'text-decoration: none; color: white;'})
          end
      end

    def next_direction
        params[:direction] == 'asc' ? 'desc' : 'asc'
    end

    def sort_indicator
        tag.span(class: "sort sort-#{params[:direction]}")
    end

    def year_list
        (2013..Time.now.year).to_a.reverse
    end

    def month_list
        Date::MONTHNAMES.compact.unshift("Select month")
    end

    def sort_column
        [["MONTH", "water_billing_transactions.month"], [ "NAME", "users.first_name"], ["STATUS", "water_billing_transactions.is_paid"]]
    end

    def status_list
        WaterBillingTransaction::STATUS.map do |s|
            [s.capitalize(), s]
        end.unshift("Select status")
    end

    def street_list
        Subdivision.joins(:addresses).where("subdivisions.id": params[:subdivision_id]).select("addresses.street").pluck(:street).uniq.map{|s| s.capitalize}.compact.unshift("Select Street")
    end

    def money_format(value)
        number_to_currency(value, unit:"₱")
    end

end
