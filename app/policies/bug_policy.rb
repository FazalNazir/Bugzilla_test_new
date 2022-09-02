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
    if @user.QualityAssurance?
      @record
    elsif @user.Developer?
      @record.solver_id == @user.id
    end
  end

  def update?
    if @user.QualityAssurance?
      @record.all
    elsif @user.Developer?
      @record.solver_id == @user.id
    end
  end

  def edit?
    @user.QualityAssurance?
  end

  def destroy?; end
end
