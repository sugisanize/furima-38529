FactoryBot.define do
  factory :item do
    name           {Faker::Name.initials}
    content        {Faker::Lorem.sentence}
    category_id    {'2'}
    status_id      {'2'}
    charge_id      {'2'}
    prefecture_id  {'2'}
    deliveryday_id {'2'}
    price          {Faker::Number.between(from: 300, to: 9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
