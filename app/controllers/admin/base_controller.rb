class Admin::BaseController < ApplicationController
  skip_before_action :load_categories_for_menu

  before_action :require_login

  layout "admin"

  protected

  def require_login
  end
end