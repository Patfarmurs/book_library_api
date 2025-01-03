class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :topic, :quantity, :available_quantity
  belongs_to :shelf
end
