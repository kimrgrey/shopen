class AddNameAndDescriptionToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :name, :string
    add_column :photos, :description, :text
  end
end
