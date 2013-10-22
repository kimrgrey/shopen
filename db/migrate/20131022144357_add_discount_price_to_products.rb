class AddDiscountPriceToProducts < ActiveRecord::Migration
  def change
     add_money :products, :discount_price
  end
end
