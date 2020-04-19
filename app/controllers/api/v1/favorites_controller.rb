class Api::V1::FavoritesController < ApplicationController
  def index
    user_favorites = current_user.favorites

    @favorite_albums = user_favorites.where(favoritable_type: 'Album').map(&:favoritable)
    @favorite_songs = user_favorites.where(favoritable_type: 'Song').map(&:favoritable)
    @favorite_artists = user_favorites.where(favoritable_type: 'Artist').map(&:favoritable)
  end

  def create
    current_user.favorites.create!(
      favoritable_type: params[:favoritable_type],
      favoritable_id: params[:id]
    )

    head :created
  end

  def destroy
    @favoritable = current_user.favorites.find_by(
      favoritable_type: params[:favoritable_type],
      favoritable_id: params[:id]
    )

    if @favoritable
      @favoritable.destroy

      head :ok
    else
      render json: 'It wasn\'t possible to find this favorite...'
    end
  end
end
