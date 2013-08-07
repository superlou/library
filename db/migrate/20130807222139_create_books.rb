class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :code
      t.string :title
      t.integer :volume
      t.boolean :adult
      t.text :notes

      t.timestamps
    end
  end
end
