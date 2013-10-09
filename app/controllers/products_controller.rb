class ProductsController < ApplicationController
  before_action :load_categories
  
  def index   
  end

  private

  def load_categories
    @categories = Category.all
    @categories = @categories.order(:name)
  end
end