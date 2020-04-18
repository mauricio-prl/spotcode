FactoryBot.define do
  factory :album do
    title { FFaker::Book.title }
    date { "2020-04-18 11:38:07" }
    category
    artist
  end
end
