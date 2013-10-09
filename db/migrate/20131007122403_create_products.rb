class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, :precision => 14, :scale => 4
      t.string :currency
      t.integer :category_id
      t.timestamps
    end
  end
end
