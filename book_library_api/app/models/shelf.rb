class Shelf < ApplicationRecord
  has_many :books, dependent: :destroy
end
