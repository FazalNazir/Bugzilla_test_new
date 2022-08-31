# frozen_string_literal: true

# Controller for Bugs
class BugsController < ApplicationController
  before_action :set_bug, only: %i[show edit update destroy]
  def index
    @bug = policy_scope(Bug)
  end

  def show
    authorize @bug
  end

  def new
    @bug = Bug.new
  end

  def create
    @bug = Bug.create(bug_params)
    if @bug.save
      flash[:notice] = 'Bug successfully added!'
      redirect_to bug_path(@bug)
    else
      flash[:alert] = 'Something wrong with your inputs!'
      render :new
    end
  end

  def edit
    authorize @bug
  end

  def update
    authorize @bug
    @bug.update(bug_params)

    redirect_to bug_path(@bug)
  end

  def destroy
    @bug.destroy

    redirect_to bugs_path
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :creator_id, :solver_id, :proj_id, :deadline, :status, :type, :image)
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end
end
