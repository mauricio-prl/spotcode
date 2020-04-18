FactoryBot.define do
  factory :artist do
    name { FFaker::Name.name }

    trait :with_photo do
      after :build do |artist|
        artist.photo.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'support', 'image_example.jpeg')),
          filename: 'photo.jpeg', content_type: 'image/jpeg'
        )
      end
    end
  end
end
