class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :book, foreign_key: true
      t.string :user_name
      t.date :loaned_at
      t.date :returned_at
      
      t.timestamps
    end
  end
end
