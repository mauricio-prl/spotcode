class Api::V1::DashboardController < ApplicationController
  def index
    load_recent_heard
    load_recommendations
  end

  private

  def load_recent_heard
    @recent_albums = RecentAlbumsFinder.call(current_user)
    @heard_categories = @recent_albums&.map(&:category)&.uniq
  end

  def load_recommendations
    @recommended_albums = RecommendationsLoader.call(@heard_categories)
  end
end
