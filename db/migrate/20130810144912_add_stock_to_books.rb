class AddStockToBooks < ActiveRecord::Migration
  def change
    add_column :books, :stock, :integer
  end
end
