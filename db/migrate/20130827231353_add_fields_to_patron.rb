class AddFieldsToPatron < ActiveRecord::Migration
  def change
    add_column :patrons, :notes, :text
    add_column :patrons, :adult, :boolean
  end
end
