class RecentAlbumsFinder
  def self.call(*args)
    new(*args).call
  end

  def initialize(user)
    @user = user
  end

  def call
    return unless @user

    user_recently_albums.map(&:album)
  end

  private

  def user_recently_albums
    @user_recently_albums ||= @user.recently_heards.order(created_at: :desc).limit(4)
  end
end
