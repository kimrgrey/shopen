class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  
  has_many :photos
  has_many :reviews
  has_many :discounts

  monetize :base_price_kopeks
  monetize :discount_price_kopeks

  def has_discount?
    discounts.active.any?
  end
end