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
end
