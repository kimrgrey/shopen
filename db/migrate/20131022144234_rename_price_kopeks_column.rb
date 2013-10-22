class RenamePriceKopeksColumn < ActiveRecord::Migration
  def change
    rename_column :products, :price_kopeks, :base_price_kopeks
  end
end
