# frozen_string_literal: true
# :nodoc:
class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_settings

  # GET /settings
  def index
  end

  # PUT /settings
  def update
    respond_to do |format|
      if @setting.update(setting_params)
        format.html do
          redirect_to settings_path,
                      notice: 'Settings updated successfully'
        end
      else
        format.html { render :index }
      end
    end
  end

  private

  def set_settings
    @setting = Setting.find_by user: current_user
  end

  def setting_params
    params.require(:setting).permit(:reminder_timer, :reminder_enabled)
  end
end
