class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums
  has_one_attached :image
end
