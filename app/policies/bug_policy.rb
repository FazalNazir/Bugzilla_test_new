# frozen_string_literal: true

# Policies for Bug controller
class BugPolicy < ApplicationPolicy
  # Scope for Bug's Policies
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      if user.QualityAssurance?
        scope.all
      elsif user.Developer?
        # byebug
        scope.where(solver_id: user.id, proj_id: Project.first.where(developer_id: user.id).pluck(:id))
      end
    end
  end

  def show?
    user.QualityAssurance? || user.Developer?
  end

  def update?
    user.QualityAssurance? || user.Developer?
  end

  def edit?
    user.QualityAssurance?
  end

  def destroy?
    user.QualityAssurance?
  end
end