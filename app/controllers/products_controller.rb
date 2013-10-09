class ProductsController < ApplicationController
  before_action :load_categories
  before_action :load_products

  def show
    @product = @products.find(params[:id])
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