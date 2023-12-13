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
        Date::MONTHNAMES.compact
    end
end
