FactoryBot.define do
  factory :song do
    title { FFaker::Book.title }
    played_count { 0 }
    album

    after :build do |song|
      song.file.attach(
          io: File.open(Rails.root.join('spec', 'factories', 'support', 'music_example.mp3')),
          filename: 'file.mp3', content_type: 'audio/mpeg'
        )
    end
  end
end
