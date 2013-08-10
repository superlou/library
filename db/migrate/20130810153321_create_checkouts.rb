class CreateCheckouts < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.integer :book_id
      t.integer :patron_id
      t.string :status
      t.datetime :closed_at

      t.timestamps
    end
  end
end
