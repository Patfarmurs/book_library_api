class Loan < ApplicationRecord
  belongs_to :book 

  # Validations
  validates :book_id, presence: true
  validates :user_name, presence: true, length: { maximum: 255 }
  validates :loaned_at, presence: true
end
