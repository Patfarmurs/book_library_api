require 'rails_helper'

RSpec.describe Book, type: :model do
  it "is valid with valid attributes" do
    shelf = Shelf.create!(name: "scriptures")
    book = Book.new(title: "Book of Mormon", author: "Joseph Smith", topic: "Gospel", total_count: 8, shelf: shelf)
    expect(book).to be_valid
  end

  it "is valid with valid attributes" do
    shelf = Shelf.create!(name: "scriptures")
    book = Book.new(title: "Pearl of Great Price", author: "Joseph Smith", topic: "Gospel", total_count: 5, shelf: shelf)
    expect(book).to be_valid
  end

  it "is not valid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid
  end

  it "is not valid with a negative total_count" do
    book = Book.new(total_count: -1)
    expect(book).not_to be_valid
  end
end
