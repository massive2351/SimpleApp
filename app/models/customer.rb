class Customer < ApplicationRecord
  has_many :shifts, dependent: :destroy
  attachment :image
  
  
  scope :get_by_last_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }

end
