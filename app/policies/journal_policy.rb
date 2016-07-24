# frozen_string_literal: true
# Journal related policies
class JournalPolicy < ApplicationPolicy
  def index?
    @user
  end
end
