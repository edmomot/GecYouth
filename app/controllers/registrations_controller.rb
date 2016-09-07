class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << :first_name << :last_name << :email << :phone << :birth_date
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :email << :phone << :birth_date
  end

end