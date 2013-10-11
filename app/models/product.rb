class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  
  has_many :photos
  has_many :reviews
end