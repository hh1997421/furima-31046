FactoryBot.define do
  factory :order_address do
      postal_number { '123-1234' }
      prefecture_id { 34 }
      city { '広島' }
      house_number { 'hiroshima' }
      building_name {'柳ビル'}
      phone_number { 11111111111 }
      user_id { 3 }
      item_id { 3 } 
  end
end
