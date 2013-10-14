class CategoriesController < ApplicationController
  before_action :load_categories

  def show
    params[:view_mode] ||= 'grid'
    @category = @categories.find(params[:id])
    @products = @category.products
    @products = @products.order(:name)
    @products = @products.page(params[:page]).per(params[:per])    
  end

  private

  def load_categories
    @categories = Category.all
  end
end