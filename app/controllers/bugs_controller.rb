# frozen_string_literal: true

class BugsController < ApplicationController
  before_action :set_bug, only: %i[show edit update destroy]
  def index
    @bug = Bug.all
  end

  def show; end

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

  def edit; end

  def update
    @bug.update(bug_params)

    redirect_to bug_path(@bug)
  end

  def updatestatus

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
