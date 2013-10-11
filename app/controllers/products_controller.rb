class ProductsController < ApplicationController
  before_action :load_categories
  before_action :load_products

  RELATED_PRODUCTS_COUNT = 10
  
  def index

  end
  
  def show
    @related_products = Product.all.limit(RELATED_PRODUCTS_COUNT)
    @product = @products.find(params[:id])
    @photos = @product.photos
    @reviews = @product.reviews
  end

  private

  def load_categories
    @categories = Category.all
    @categories = @categories.order(:name)
  end

  def load_products
    @products = Product.all
  end
end