class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  def self.guest
    find_or_create_by!(email: 'otameshi@gmail.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
      admin.password_confirmation = admin.password
    end
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
