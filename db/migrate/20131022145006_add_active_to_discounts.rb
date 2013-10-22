class AddActiveToDiscounts < ActiveRecord::Migration
  def change
    add_column :discounts, :active, :boolean, default: false
  end
end
