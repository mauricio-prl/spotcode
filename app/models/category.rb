class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums
  has_one_attached :image

  def artists
    Artist.joins(:albums).where(albums: { id: albums.ids }).distinct
  end

  def songs
    albums.includes(:songs).map(&:songs).flatten
  end
end
