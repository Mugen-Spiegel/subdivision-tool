# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user_params = [
    {
        first_name: "jophat",
        middle_name: "honor",
        last_name: "tamayo",
        email: "tamay06131993@gmail.com",
        block: 21,
        lot: 6,
        street: "gibeon"
    },
    {
        first_name: "gerlene",
        middle_name: "castillo",
        last_name: "tamayo",
        email: "gerlene.castillo@gmail.com",
        block: 21,
        lot: 6,
        street: "gibeon"
    },
    {
        first_name: "esmeralda lorraine",
        middle_name: "castillo",
        last_name: "tamayo",
        email: "esmeralda.castillo@gmail.com",
        block: 21,
        lot: 6,
        street: "gibeon"
    }
    
]

Subdivision.create(
    name: "Kingstown Executive Enclaves",
    city: "Caloocan",
    postal_code: "1421"
)



user_params.each do |params|
    user = User.create(
        first_name: params[:first_name],
        middle_name: params[:middle_name],
        last_name: params[:last_name],
        email: params[:email],
        subdivision_id: Subdivision.first.id
      )
      Address.create!(
        block: params[:block],
        lot: params[:lot],
        street: params[:street],
        user_id: user.id
      )
      Balance.create(amount: 0, user:user)
end

MonthlyDue.create(amount: 150, is_current: "true", subdivision_id: 1)

