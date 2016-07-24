# frozen_string_literal: true
# Policies for entry
class EntryPolicy < ApplicationPolicy
  def index?
    @user
  end
end
