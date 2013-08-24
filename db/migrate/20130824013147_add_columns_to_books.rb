class AddColumnsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :subtitle, :string
    add_column :books, :oversized, :boolean
    add_column :books, :non_standard_size, :boolean
    add_column :books, :category, :string
    add_column :books, :publisher, :string
    add_column :books, :author, :string
    add_column :books, :language, :string
  end
end
