class RecommendationsLoader
  def self.call(*args)
    new(*args).call
  end

  def initialize(heard_categories)
    @heard_categories = heard_categories
  end

  def call
    return most_heard_albums if @heard_categories&.any?

    Album.all.sample(12)
  end

  private

  def most_heard_albums
    @most_heard_albums ||=
      Album.includes(:category, :songs)
        .where(category: @heard_categories).order('songs.played_count').limit(12)
  end
end
