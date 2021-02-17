class Quote < ApplicationRecord
<<<<<<< HEAD
    
=======
  belongs_to :user

  def create
    @quote = Quote.new(quote_params)
    @quote.save!
  end

  private

  def quote_params
    params.require(
      :name,
      :type,
      :product_line,
      :elevator_unit_price,
      :elevator_total_cost,
      :installation_cost,
      :total_cost
    ).permit(
      :apartments,
      :floors,
      :basements,
      :companies,
      :parkings,
      :elevators,
      :corporation,
      :occupants,
      :hours
    )
  end
>>>>>>> main
end
