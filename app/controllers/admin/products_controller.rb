class Admin::ProductsController < Admin::BaseController
  before_action :load_products

  def index
    @products = @products.order(:name)
    @products = @products.page(params[:page]).per(params[:per])
  end

  def new
    @categories = Category.all
    @product = @products.build
  end

  def edit
    @categories = Category.all
    @product = @products.find(params[:id])
  end

  private

  def load_products
    @products = Product.all
  end
end