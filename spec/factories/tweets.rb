FactoryBot.define do
  factory :tweet do
    after(:build) do |tweet|
      tweet.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    spot { Faker::Lorem.characters(number: 16) }
    comment { Faker::Lorem.sentence }
    advice { Faker::Lorem.sentence }
    area_id { Faker::Number.between(from: 2, to: 49) }
    association :user
  end
end
