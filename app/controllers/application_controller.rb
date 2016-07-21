# frozen_string_literal: true
# :nodoc:
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Override Devise method to redirect user to journals path
  # when it succeeds the login
  def after_sign_in_path_for(_resource)
    journals_path
  end
end
