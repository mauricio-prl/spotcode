class Album < ApplicationRecord
  belongs_to :category
  belongs_to :artist

  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
end
