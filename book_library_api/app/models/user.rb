class User < ApplicationRecord
  # Associations
  has_many :checkouts
  has_many :books, through: :checkouts

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false },
                    format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\z/, 
                              message: "must be a valid email address" }
end
