# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]
  before_action :set_member, only: %i[create new edit update]

  def index
    @project = policy_scope(Project)
  end

  def show
    authorize @project
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = 'Project successfully added!'
      redirect_to projects_path
    else
      flash[:alert] = 'Something wrong with your inputs!'
      render :new
    end
  end

  def edit
    authorize @project
  end

  def update
    authorize @project
    if @project.update(project_params)
      redirect_to project_path(@project)
      flash[:notice] = 'Project successfully Updated!'
    else
      flash[:alert] = 'Unable to update project try AGAIN!'
      redirect_to edit_project_path(@project)
    end
  end

  def destroy
    authorize @project
    flash[:alert] = if @project.destroy
                      'Project successfully Deleted!'
                    else
                      'Unable to Delete!'
                    end
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :creator_id, :developer_id, :tester_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def set_member
    @devs = User.dev_only
    @qas = User.qa_only
  end
end
