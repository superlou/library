class AddKeepCheckoutHistoryToPatrons < ActiveRecord::Migration
  def change
    add_column :patrons, :keep_checkout_history, :boolean
  end
end
