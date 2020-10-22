FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '大阪市' }
    street_number { '1-1' }
    building_name { 'ビル' }
    tel_number { '09012345678' }
    token { 'test_token' }
  end
end