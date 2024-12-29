class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :topic
      t.integer :total_count, default: 0
      t.references :shelf, foreign_key: true

      t.timestamps
    end
  end
end
