class ProductsController < ApplicationController
  before_action :load_products

  RELATED_PRODUCTS_COUNT = 10

  def index
    params[:view_mode] ||= 'grid'
    @products = @products.order(:name)
    @products = @products.page(params[:page]).per(params[:per])
  end
  
  def show
    @related_products = Product.all.limit(RELATED_PRODUCTS_COUNT)
    @product = @products.find(params[:id])
    @photos = @product.photos
    @reviews = @product.reviews
  end

  private

  def load_products
    @products = Product.all
  end
end