class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.text :description
      t.date :start_at
      t.date :end_at
      t.integer :product_id
      t.decimal :price, :precision => 14, :scale => 4
      t.string :currency
      t.timestamps
    end
  end
end
