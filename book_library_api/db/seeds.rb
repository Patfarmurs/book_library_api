# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

shelf = Shelf.create(name: "Scriptures")
# Output: <Shelf id: 1, name: "Scripture", created_at: "...", updated_at: "...">

book1 = Book.create(title: "Book of Mormon", author: "Joseph Smith", topic: "Gospel", quantity: 2, shelf: shelf)
book2 = Book.create(title: "Pearl of Great Price", author: "Joseph Smith", topic: "Gospel", quantity: 3, shelf: shelf)
# Output: <Book id: 1, title: "Dune", ...> and <Book id: 2, title: "Foundation", ...>


user = User.create(name: "Patrick Mukula", email: "patrickkeita80@yahoo.com")
# Output: <User id: 1, name: "John Doe", email: "john.doe@example.com", ...>

