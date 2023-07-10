class Book < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def calculate_number_of_nights
    self.check_out_date - self.check_in_date
  end

  def calculate_payment_amount(charge_per_night)
    charge_per_night * self.number_of_people * self.number_of_nights
  end
  
end
