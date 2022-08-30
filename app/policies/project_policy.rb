# frozen_string_literal: true

# Project Policy
class ProjectPolicy < ApplicationPolicy
  # Project Scope for policies
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.Developer?
        scope.where(developer_id: user.id)
      elsif user.QualityAssurance?
        scope.where(tester_id: user.id)
      else
        scope.where(creator_id: user.id)
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
