# frozen_string_literal: true
class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:q] || ''
    @results = Entry.search query.parameterize, current_user
  end
end
