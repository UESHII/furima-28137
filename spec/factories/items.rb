FactoryBot.define do
  factory :item do
    name {"Example Item"}
    description {"Example Text"}
    price {1000}
    category_id {1}
    condition_id {1}
    delivery_fee_id {1}
    prefecture_id {1}
    lead_time_id {1}
    
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
  


end