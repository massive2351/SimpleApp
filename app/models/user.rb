class User < ApplicationRecord
  has_many :shifts, dependent: :destroy
  has_many :records, dependent: :destroy

  scope :get_by_last_name, ->(last_name) {
    where("last_name like ?", "%#{last_name}%")
  }
  
  def self.guest
    find_or_create_by!(email: 'staff@gmail.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.last_name = "山田" 
      user.first_name = "太郎" 
      user.last_name_kana = "ヤマダ" 
      user.first_name_kana = "タロウ" 
      user.postal_code = 5810085 
      user.address = "大阪府八尾市安中町5-12" 
      user.telephone_number = "00000000000" 
    end
    
  end
 

  attachment :image
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/i}
  validates :last_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/i}
  validates :email, presence: true
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/i}
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10,11}\z/i}
  
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
