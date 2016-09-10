class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def new
    @address = Address.new
    super
  end

  def create
    p = permit_address_params(params)
    f = consistent_address_fields(p)

    super { |u|
      u.address =  Address.find_or_create_by(f)
    }
  end

  def edit
    @address = current_user.address.present? ? current_user.address : Address.new
    super
  end

  def update
    p = permit_address_params(params)
    f = consistent_address_fields(p)
    current_user.address = Address.find_or_create_by(f)

    current_user.save

    super
  end

  protected

  def consistent_address_fields(params)
    new_params = {}

    params.each { |k, v|
      if v.blank?
        new_params[k] = nil
      else
        case k
          # Use strings here, not :symbols, or it will ruin your day
          when 'address1', 'address2', 'city'
            new_params[k] = v.title_case
          when 'state'
            new_params[k] = v.upcase.strip
          else
            new_params[k] = v.strip
        end
      end
    }

    new_params
  end

  def permit_address_params(params)
    params[:address].permit([:address1, :address2, :city, :state, :zip])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up)        << :first_name << :last_name << :email << :phone << :birth_date
    devise_parameter_sanitizer.for(:account_update) << :first_name << :last_name << :email << :phone << :birth_date
  end
end

class String
  def title_case
    title = self.split
    title.map do |word|
      word.capitalize
    end.join(" ")
  end
end