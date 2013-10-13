class RegistrationsController < Devise::RegistrationsController
  before_action :load_categories

  private

  def load_categories
    @categories = Category.all
    @categories.order(:name)
  end
end