class AddMoneyToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :price, :decimal
    remove_column :products, :currency, :string
    
    add_money :products, :price
  end
end
