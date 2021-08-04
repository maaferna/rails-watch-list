class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :list, presence: true
  validates :movie, presence: true, uniqueness: { scope: :list, message: "it's on the list"}
end
