FactoryBot.define do
  factory :category do
    name { FFaker::Name.name }

    trait :with_image do
      after :build do |category|
        category.image.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'support', 'image_example.jpeg')),
          filename: 'image.jpeg', content_type: 'image/jpeg'
        )
      end
    end
  end
end
