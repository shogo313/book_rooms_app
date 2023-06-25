class Room < ApplicationRecord
  belongs_to :user
  
  validates :name, presence: true
  validates :introduction, length:{maximum: 50}
  validates :charge_per_night, presence: true, numericality: true
  validates :detail, presence: true, length:{maximum: 1000}
  validates :address, presence: true, length:{maximum: 60}
end
