# frozen_string_literal: true
# Main Policy that all others must inherit from
# If those rules does not satisfy the model, they can be
# overwiritten.
# All methods relies on the base that the user must be logged in
# and the resource must be owned by the user
class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    @user.eql? @record.user
  end

  def show?
    scope.where(id: record.id, user_id: record.user.id).exists?
  end

  def create?
    @user
  end

  def new?
    @user
  end

  def update?
    @user.eql? @record.user
  end

  def edit?
    update?
  end

  def destroy?
    @user.eql? @record.user
  end

  def scope
    Pundit.policy_scope!(user, record.class)
  end

  # :nodoc:
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end
