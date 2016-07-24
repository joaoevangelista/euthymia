# frozen_string_literal: true
# Policies for entry
class EntryPolicy < ApplicationPolicy
  def index?
    @user
  end

  def favorite?
    update?
  end

  def unfavorite?
    update?
  end
end
