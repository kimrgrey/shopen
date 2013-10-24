class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_locale
  before_action :load_categories_for_menu

  protected

  def load_categories_for_menu
    @categories_for_menu = Category.all
    @categories_for_menu.order(:name)
  end

  private

  def default_url_options(options={})
    { :locale => I18n.locale == I18n.default_locale ? nil : I18n.locale  }
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
end
