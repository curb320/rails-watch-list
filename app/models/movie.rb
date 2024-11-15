class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true;
  validates :title, presence: { message: "cannot be blank" }
end
