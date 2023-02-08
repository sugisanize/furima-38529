FactoryBot.define do
  factory :order_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id  { '2' }
    municipalities { 'あいうえお市' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    telephone { '09012345678' }
  end
end
