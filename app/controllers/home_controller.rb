# frozen_string_literal: true
# :nodoc:
class HomeController < ApplicationController
  def index
    redirect_to journals_path if current_user
  end
end
