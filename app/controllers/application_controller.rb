class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :load_categories_for_menu, only: [:index, :show, :new, :edit]

  protected

  def load_categories_for_menu
    @categories_for_menu = Category.all
    @categories_for_menu.order(:name)
  end
end
