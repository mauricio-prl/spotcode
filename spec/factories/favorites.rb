FactoryBot.define do
  factory :favorite do
    user
    favoritable { [create(:album), create(:song), create(:artist)].sample }
  end
end
