class Room < ApplicationRecord
  belongs_to :user
  has_many :books

  has_one_attached :image 
  
  validates :name, presence: true
  validates :introduction, length:{maximum: 50}
  validates :charge_per_night, presence: true, numericality: true
  validates :detail, presence: true, length:{maximum: 1000}
  validates :address, presence: true, length:{maximum: 60}

  
  def self.search(word_name_detail, word_area)
    if word_area.present? || word_name_detail.present?
      @rooms = Room.where('concat(name, detail) like ? and address like ?', "%#{word_name_detail}%", "%#{word_area}%")
    elsif word_name_detail.present? || word_area.empty?
      @rooms = Room.where('concat(name, detail) like ?',"%#{word_name_detail}%")
    elsif word_area.present? || word_name_detail.empty?
      @rooms = Room.where('address like ?',"%#{word_area}%")
    end
  end
end

