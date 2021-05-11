class User < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :records, dependent: :destroy

  scope :get_by_last_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }

  attachment :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
