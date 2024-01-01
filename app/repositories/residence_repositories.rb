class ResidenceRepositories

    attr_accessor :first_name, :where_like_clause, :subdivision_id, :last_name, :street

    def initialize(params, subdivision_id)
        self.first_name = params["first_name"] || ""
        self.last_name = params["last_name"] || ""
        self.street = params["street"] || "Select Street"
        self.subdivision_id = subdivision_id
        self.where_like_clause = ""
    end

    def search_residence

        unless self.first_name.empty?
            self.where_like_clause += "users.first_name LIKE '%#{self.first_name.downcase}%'" 
        end

        unless self.last_name.empty?
            unless self.first_name.empty?
                self.where_like_clause += " AND "
            end 
            self.where_like_clause += "users.last_name LIKE '%#{self.last_name.downcase}%'" 
        end

        User.select("users.id,
            users.first_name AS first_name,
            users.middle_name AS middle_name,
            users.last_name AS last_name,
            users.block AS block,
            users.lot AS lot,
            users.street  AS street
        ")
        .where(self.where_like_clause)
        .where("users.subdivision_id = ?", self.subdivision_id)
        
    end

end