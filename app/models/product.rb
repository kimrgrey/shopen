class Product < ActiveRecord::Base
  belongs_to :category, :counter_cache => true
  
  has_many :photos
  has_many :reviews
  has_many :sales

  def sale?
    sales.where('sales.start_at > :d AND sales.end_at <= :d', Date.today).any?
  end

  def sale
    sales.where('sales.start_at > :d AND sales.end_at <= :d', Date.today).first
  end
end