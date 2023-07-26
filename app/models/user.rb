class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :rooms
  has_many :books

  has_one_attached :image

  validates :name, presence: true
  validates :introduction, length:{maximum: 1000}
end
