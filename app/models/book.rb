class Book < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :check_in_date, presence: true
  validates :check_out_date, presence: true
  validates :number_of_people, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1 }
  validate :check_in_date_after_today
  validate :check_out_date_after_check_in_date

  def check_in_date_after_today
    unless check_in_date.nil?
      errors.add(:check_in_date, "は本日以降の日付を選択してください") if check_in_date < Date.today
    end
  end

  def check_out_date_after_check_in_date
    unless check_in_date.nil? || check_out_date.nil?
      errors.add(:check_out_date, "はチェックインより後の日付を選択してください") if check_in_date > check_out_date
    end
  end

  def calculate_number_of_nights
    unless check_in_date.nil? || check_out_date.nil?
      check_out_date - check_in_date
    end
  end

  def calculate_payment_amount
    unless number_of_people.nil? || number_of_nights.nil?
      room.charge_per_night * number_of_people * number_of_nights
    end
  end
end
