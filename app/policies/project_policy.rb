# frozen_string_literal: true

# Project Policy
class ProjectPolicy < ApplicationPolicy
  # Project Scope for policies
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.Developer?
        scope.where(developer_id: user.id)
      else
        scope.all
      end
    end
  end

  def update?
    user.Manager?
  end

  def destroy?
    user.Manager?
  end
end
