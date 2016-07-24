# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:q].parameterize || ''
    @results = Entry.search query, current_user
  end
end
