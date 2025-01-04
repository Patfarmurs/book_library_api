class Checkout < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :checkout_date, presence: true
  validates :return_date, presence: true, if: -> { returned }
end
