class AddUserIdToShelves < ActiveRecord::Migration[7.0]
  def change
    add_reference :shelves, :user, null: false, foreign_key: true
  end
end
