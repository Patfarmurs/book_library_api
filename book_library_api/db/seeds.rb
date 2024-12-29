# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a new shelf to associate with the book (if not already created)
shelf = Shelf.create(name: "Scriptures")

# Create a new book and associate it with the shelf
book = Book.create(
  title: "The Book of Mormon",
  author: "Joseph Smith",
  topic: "Gospel",
  total_count: 8,
  shelf: shelf
)

book = Book.create(
  title: "The Pearl of Great Price",
  author: "Joseph Smith",
  topic: "Gospel",
  total_count: 5,
  shelf: shelf
)

