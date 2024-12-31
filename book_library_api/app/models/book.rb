# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :shelf
  has_many :loans

  # Ensure total_count defaults to 0 if not specified
  before_validation :set_default_total_count

  def available_count
    total_count - loans.where(returned_at: nil).count
  end

  private

  def set_default_total_count
    self.total_count ||= 0
  end

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :author, presence: true, length: { maximum: 255 }
  validates :topic, presence: true, length: { maximum: 100 }
  validates :total_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
