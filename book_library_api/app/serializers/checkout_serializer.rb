class CheckoutSerializer < ActiveModel::Serializer
  attributes :id, :checkout_date, :return_date, :returned
  belongs_to :user
  belongs_to :book
end
