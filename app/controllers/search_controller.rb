class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
    query = params[:q] || ''
    @results = Entry.search_by_body(body: query, user_id: current_user.id)
  end
end
