class Api::V1::DashboardController < ApplicationController
  before_action :load_recent_heard, only: [:index]
  before_action :load_recommendations, only: [:index]

  def index; end

  private

  def load_recent_heard
    @recent_albums = RecentAlbumsFinder.call(current_user)
    @heard_categories = @recent_albums&.map(&:category)&.uniq
  end

  def load_recommendations
    @recommended_albums = RecommendationsLoader.call(@heard_categories)
  end
end
