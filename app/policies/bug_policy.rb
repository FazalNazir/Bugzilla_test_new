# frozen_string_literal: true

# Policies for Bug controller
class BugPolicy < ApplicationPolicy
  # Scope for Bug's Policies
  class Scope < Scope
  end

  def index?
    user.QualityAssurance? || user.Developer?
  end

  def show?
    index?
  end

  def update?
    index?
  end

  def edit?
    index?
  end

  def destroy?
    user.QualityAssurance?
  end
end
