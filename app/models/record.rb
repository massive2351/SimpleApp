class Record < ApplicationRecord
  belongs_to :shift, optional: true
  belongs_to :user, optional: true

  enum face:{
    良: 0,
    不良: 1,
  }

  enum sewat:{
    有: 0,
    無: 1,
  }

  enum bath_care:{
    清拭: 0,
    全身浴: 1,
  }

  before_save do
   bath_care_before_type_cast
  end


  before_save do
    self.excretion_care.gsub!(/[\[\]\"]/, "") if attribute_present?("excretion_care")
    self.move_care.gsub!(/[\[\]\"]/, "") if attribute_present?("move_care")
    self.clean_care.gsub!(/[\[\]\"]/, "") if attribute_present?("clean_care")
  end

end
