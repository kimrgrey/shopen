class Admin::ProductsController < Admin::BaseController
  def index
    @products = Product.all
    @products = @products.order(:name)
    @products = @products.page(params[:page]).per(params[:per])
  end
end