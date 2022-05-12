class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }

  validates :movie_id, uniqueness: { scope: :list_id, message: 'This film already exist in your list.' }
end