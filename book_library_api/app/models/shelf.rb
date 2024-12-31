class Shelf < ApplicationRecord
  belongs_to :user
  has_many :books, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
end
