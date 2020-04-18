FactoryBot.define do
  factory :song do
    title { FFaker::Book.title }
    played_count { 0 }
    album
  end
end
