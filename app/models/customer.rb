class Customer < ApplicationRecord
  has_many :shifts, dependent: :destroy
  attachment :image


  scope :get_by_last_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }

  geocoded_by :address
  after_validation :geocode

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/i}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/i}
  validates :email, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/i}
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/i}

end
