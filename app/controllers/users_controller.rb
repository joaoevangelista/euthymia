# frozen_string_literal: true
# Additional user related controller
class UsersController < ApplicationController
  before_action :set_user, only: [:finish_signup]

  # GET/PATCH /users/:id/finish_signup
  def finish_signup
    if request.patch? && params[:user] # && params[:user][:email]
      if @user.update(user_params)

        sign_in(@user, bypass: true)
        redirect_to journals_path, notice: 'Your profile was successfully updated.'
      else
        @show_errors = true
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

  def set_user
    @user = current_user
  end
end
