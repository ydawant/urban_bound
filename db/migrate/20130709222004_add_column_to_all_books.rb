class AddColumnToAllBooks < ActiveRecord::Migration
  def change
  	add_column :all_books, :rating, :integer
  end
end
