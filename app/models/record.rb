class Record < ApplicationRecord
  belongs_to :shift, optional: true
  belongs_to :user, optional: true

  enum face:{
    良: 1,
    不良: 2,
  }

  enum sewat:{
    " ": 0,
    有: 1,
    無: 2,
  }

  enum bath_care:{
    "  ": 0,
    清拭: 1,
    全身浴: 2,
  }

  before_save do
   bath_care_before_type_cast
  end

  before_save do
    self.excretion_care.gsub!(/[\[\]\"]/, "") if attribute_present?("excretion_care")
    self.move_care.gsub!(/[\[\]\"]/, "") if attribute_present?("move_care")
    self.clean_care.gsub!(/[\[\]\"]/, "") if attribute_present?("clean_care")
  end

  #recordの本日のデータを取得
  def self.record_today
    where("created_at >= ?", Date.today)
  end


end
