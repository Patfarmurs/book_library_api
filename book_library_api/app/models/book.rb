# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :shelf
  has_many :checkouts
  has_many :users, through: :checkouts

 
  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :topic, presence: true, length: { maximum: 100 }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def available_quantity
    quantity - checkouts.where(returned: false).count
  end
end
