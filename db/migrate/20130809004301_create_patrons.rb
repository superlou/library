class CreatePatrons < ActiveRecord::Migration
  def change
    create_table :patrons do |t|
      t.string :name
      t.string :code
      t.string :gender
      t.string :email

      t.timestamps
    end
  end
end
