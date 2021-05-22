FactoryBot.define do
  factory :user do 
    last_name { "手酢斗" }
    first_name { "手酢斗" }
    last_name_kana { "テスト" }
    first_name_kana { "テスト" }
    postal_code { 5810085 }
    address { "大阪府八尾市安中町5-12" }
    telephone_number { "00000000000" }
    email { Faker::Internet.email }
    password { "password" }
    password_confirmation { "password" }
  end
  
  factory :customer do 
    last_name { "手酢斗" }
    first_name { "手酢斗" }
    last_name_kana { "テスト" }
    first_name_kana { "テスト" }
    postal_code { 5810085 }
    address { "大阪府八尾市安中町5-12" }
    telephone_number { "00000000000" }
    email { Faker::Internet.email }
  end
  
  factory :shift do 
    start_time { "00:00" }
    end_time { "00:00" }
    type { 1 }
    work { 1 }
    status { 0 }
    user_id { 1 }
    customer_id { 1 }
  end
  
  factory :information do 
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
  end
  
 
end

