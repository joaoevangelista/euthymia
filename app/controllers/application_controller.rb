# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error_notice] = t("#{policy_name}.#{exception.query}", scope: 'pundit',
                                                                  default: :default)
    redirect_to(request.referrer || root_path)
  end

  # Override Devise method to redirect user to journals path
  # when it succeeds the login
  def after_sign_in_path_for(_resource)
    journals_path
  end
end
