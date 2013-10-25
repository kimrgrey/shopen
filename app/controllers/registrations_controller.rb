class RegistrationsController < Devise::RegistrationsController

  before_action :not_found, only: [:edit, :update, :destrory, :cancel]
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :first_name
    devise_parameter_sanitizer.for(:sign_up) << :last_name
  end
end