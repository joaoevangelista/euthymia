# frozen_string_literal: true
# Customization of Devise Controller
class RegistrationsController < Devise::RegistrationsController
  def sign_up_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation, :current_password)
  end

  def account_update_params
    params.require(:user).permit(:email, :name, :password,
                                 :password_confirmation, :current_password)
  end
end
