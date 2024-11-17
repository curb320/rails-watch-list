# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb


# http://www.omdbapi.com/?apikey=[yourkey]&


Movie.create(
  title: "Chronicle",
  overview: "Three high school friends gain superpowers after making an incredible discovery underground. Soon they find their lives spinning out of control and their bond tested as they embrace their darker sides.",
  poster_url: "https://image.tmdb.org/t/p/original/6wEegj9nwjyWmmOcJ5MENPldCBr.jpg",
  rating: 7.0
)
