FactoryBot.define do
  factory :album do
    title { FFaker::Book.title }
    date { "2020-04-18 11:38:07" }
    category
    artist

    trait :with_cover do
      after :build do |album|
        album.cover.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'support', 'image_example.jpeg')),
          filename: 'cover.jpeg', content_type: 'image/jpeg'
        )
      end
    end
  end
end
