# frozen_string_literal: true

# Policies for Bug controller
class BugPolicy < ApplicationPolicy
  # Scope for Bug's Policies
  class Scope < Scope
  end

  def index?
    if @user.QualityAssurance?
      @record.all
    elsif @user.Developer?
      @record.where(solver_id: @user.id)
    end
  end

  def show?
    @user.QualityAssurance? || (@user.Developer? && @record.solver_id == @user.id)
  end

  def update?
    @user.QualityAssurance? || (@user.Developer? && @record.solver_id == @user.id)
  end

  def new?
    @user.QualityAssurance?
  end

  def create?
    @user.QualityAssurance?
  end

  def edit?
    @user.QualityAssurance?
  end

  def destroy?
    @user.QualityAssurance? && @record.creator_id == @user.id
  end
end
