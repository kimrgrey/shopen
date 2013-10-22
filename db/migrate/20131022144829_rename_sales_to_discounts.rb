class RenameSalesToDiscounts < ActiveRecord::Migration
  def change
    rename_table :sales, :discounts
  end
end
