class Record < ApplicationRecord
  has_one :shift
  
  enum face:{
    良: 0,
    不良: 1,
  }
  
  enum sweat:{
    有: 0,
    無: 1,
  }
  
  enum bath_care:{
    清拭: 0,
    全身浴: 1,
    身体生活: 2,
  }
end
