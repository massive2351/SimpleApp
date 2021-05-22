class Shift < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :customer, optional: true
  has_one :record, dependent: :destroy

  self.inheritance_column = :_type_disabled
  
  validates :user_id, presence: true
  validates :customer_id, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :type, presence: true
  validates :work, presence: true
  validates :status, presence: true

  enum type:{
    身体介護: 0,
    生活支援: 1,
    身体生活: 2,
  }

  enum work:{
    食事介助: 0,
    入浴介助: 1,
    清拭: 2,
    排泄介助: 3,
    移動介助: 4,
    更衣介助: 5,
    見守り: 6,
    外出支援: 7,
    買い物: 8,
    調理: 9,
    掃除: 10,
  }
  
   enum status:{
    準備中: 0,
    開始: 1,
    終了: 2,
  }

end
