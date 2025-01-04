class CreateCheckouts < ActiveRecord::Migration[7.0]
  def change
    create_table :checkouts do |t|
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :returned, default: false
      t.date :checkout_date
      t.date :return_date

      t.timestamps
    end
  end
end
