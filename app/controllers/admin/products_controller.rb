class Admin::ProductsController < Admin::BaseController
  before_action :load_products

  def index
    @products = @products.order(:name)
    @products = @products.page(params[:page]).per(params[:per])
  end

  def show 
    @product = @products.find(params[:id])
    @discounts = @product.discounts
  end

  def new
    @categories = Category.all
    @product = @products.build
  end

  def create
    @categories = Category.all
    @product = @products.build(product_params)
    if @product.save
      redirect_to admin_product_path(@product), flash: { notice: t('admin.products.create.success') }
    else
      render :new
    end
  end

  def edit
    @categories = Category.all
    @product = @products.find(params[:id])
  end

  def update
    @categories = Category.all
    @product = @products.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path(@product), flash: { notice: t('admin.products.update.success') }
    else
      render :edit
    end
  end

  private

  def product_params
    fields = [:name, :description, :base_price, :category_id]
    params.require(:product).permit(*fields)
  end

  def load_products
    @products = Product.all
  end
end