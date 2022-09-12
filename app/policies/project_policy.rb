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
        scope.all
      else
        scope.where(creator_id: user.id)
      end
    end
  end

  def index?
    user.Manager?
  end

  def new?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def show?
    if @user.Developer?
      @record.developer_id == @user.id
    else
      Project.all
    end
  end

  def destroy?
    index?
  end
end
