class Artist < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :albums
  has_one_attached :photo
end
