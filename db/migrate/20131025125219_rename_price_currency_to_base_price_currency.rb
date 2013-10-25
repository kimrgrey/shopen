class RenamePriceCurrencyToBasePriceCurrency < ActiveRecord::Migration
  def change
    rename_column :products, :price_currency, :base_price_currency
  end
end
