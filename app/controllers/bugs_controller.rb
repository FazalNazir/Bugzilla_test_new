# frozen_string_literal: true

# Controller for Bugs
class BugsController < ApplicationController
  before_action :set_project
  before_action :set_member, only: %i[create new edit update]
  before_action :set_bug, only: %i[show edit update destroy]
  def index
    authorize @project.bugs
    @bugs = @project.bugs
  end

  def show
    authorize @bug
  end

  def new
    @bug = @project.bugs.build
    authorize @bug
  end

  def create
    @bug = @project.bugs.build(bug_params)
    if @bug.save
      flash[:notice] = 'Bug successfully added!'
      redirect_to project_bug_path(@project, @bug)
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
    if @bug.update(bug_params)
      redirect_to project_bug_path(@project), success: 'Bug successfully Updated'
    else
      flash[:alert] = 'Unable to update!'
      render :new
    end
  end

  def destroy
    authorize @bug
    flash[:notice] = if @bug.destroy
                       'Bug successfully Deleted!'
                     else
                       'Unable to delete Bug!'
                     end
    redirect_to project_bugs_path(@bug)
  end

  private

  def bug_params
    params.require(:bug).permit(:title, :creator_id, :solver_id, :proj_id, :deadline, :status, :type, :image,
                                :description)
  end

  def set_bug
    @bug = Bug.find(params[:id])
  end

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_member
    @devs = User.dev_only
  end
end
