class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates_presence_of :movie, :list

  # A bookmark must be linked to a movie and a list, and the [movie, list] pairings should be unique.
  validates_uniqueness_of :movie_id,  { scope: :list_id }

  # The comment of a bookmark cannot be shorter than 6 characters.
  validates :comment, presence: true, length: { minimum: 6}
end
