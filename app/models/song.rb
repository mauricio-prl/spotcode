class Song < ApplicationRecord
  belongs_to :album

  validates :title, presence: true, uniqueness: true
  validates :played_count, numericality: { greater_than_or_equal_to: 0 }
end
