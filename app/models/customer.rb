class Customer < ApplicationRecord
  has_many :shifts, dependent: :destroy
  attachment :image
end
