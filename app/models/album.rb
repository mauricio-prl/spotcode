class Album < ApplicationRecord
  belongs_to :category
  belongs_to :artist

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true

  has_many :songs
  has_many :recently_heards
end
