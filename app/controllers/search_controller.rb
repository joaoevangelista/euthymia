class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    @query = sanitize(params[:q] || '')
    @results = Entry.search_by(body: @query, user: current_user)
  end
end
