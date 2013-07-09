class CreateAllBooks < ActiveRecord::Migration
  def change
    create_table :all_books do |t|
      t.references :user
      t.references :book

      t.timestamps
    end
    add_index :all_books, :user_id
    add_index :all_books, :book_id
  end
end
