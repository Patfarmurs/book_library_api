require 'rails_helper'

RSpec.describe Book, type: :model do
  # Validation tests
  it 'is valid with a title, author, topic, and quantity' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.new(title: 'Ruby Programming', author: 'Yukihiro Matsumoto', topic: 'Programming', quantity: 5, shelf: shelf)
    expect(book).to be_valid
  end

  it 'is invalid without a title' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.new(title: nil, author: 'Yukihiro Matsumoto', topic: 'Programming', quantity: 5, shelf: shelf)
    expect(book).to_not be_valid
  end

  it 'is invalid without an author' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.new(title: 'Ruby Programming', author: nil, topic: 'Programming', quantity: 5, shelf: shelf)
    expect(book).to_not be_valid
  end

  it 'is invalid without a topic' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.new(title: 'Ruby Programming', author: 'Yukihiro Matsumoto', topic: nil, quantity: 5, shelf: shelf)
    expect(book).to_not be_valid
  end

  it 'is invalid with a negative quantity' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.new(title: 'Ruby Programming', author: 'Yukihiro Matsumoto', topic: 'Programming', quantity: -1, shelf: shelf)
    expect(book).to_not be_valid
  end

  # Custom method test
  it 'calculates available quantity correctly' do
    shelf = Shelf.create!(name: 'Shelf A')
    book = Book.create!(title: 'Ruby Programming', author: 'Yukihiro Matsumoto', topic: 'Programming', quantity: 5, shelf: shelf)
    user = User.create!(name: 'Patrick', email: 'patrick@example.com')

    book.checkouts.create!(user: user, checkout_date: Date.today, returned: false)

    expect(book.available_quantity).to eq(4)
  end
end
