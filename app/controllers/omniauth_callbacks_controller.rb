# frozen_string_literal: true
# Override of Devise omniauth
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def provider
    auth = request.env['omniauth.auth']
    @user = User.find_for_oauth(auth, current_user)

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success,
                        kind: auth.provider.to_s.capitalize) if is_navigational_format?
    else
      session["devise.#{auth.provider}_data"] = request.env['omniauth.auth']
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

  alias twitter provider
  alias facebook provider
  alias google_oauth2 provider

  def after_sign_in_path_for(resource)
    if resource.email_verified?
      super resource
    else
      finish_signup_path(resource)
    end
  end
end
