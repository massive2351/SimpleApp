class Shift < ApplicationRecord
  belongs_to :user

  self.inheritance_column = :_type_disabled

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

end
