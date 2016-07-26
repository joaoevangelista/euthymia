# frozen_string_literal: true
# Override of Devise omniauth
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  include Devise::Controllers::Rememberable

  def provider
    auth = request.env['omniauth.auth']
    identity = Identity.find_for_oauth(auth)
    @user = User.find_for_oauth(auth, identity ,current_user)

    if @user.persisted?
      link_account_or_signin(identity, @user, auth)
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

  def link_account_or_signin(identity, user, auth)
    if user_signed_in?
      if identity.user == current_user
        redirect_to edit_user_registration_path(user), notice: 'Account already linked!'
      else
        identity.user = current_user
        identity.save
        redirect_to edit_user_registration_path(user), notice: 'Succefully link account!'
      end
    else
      sign_in_and_redirect user, event: :authentication
      remember_me(user)
      set_flash_message(:notice, :success,
                        kind: auth.provider.to_s.capitalize) if is_navigational_format?
    end
  end
end
