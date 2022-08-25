# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show edit update destroy]

  def index
    @project = Project.all
  end

  def show; end

  def new
    @project = Project.new
  end

  def create
    @project = Project.create(project_params)

    if @project.save
      flash[:notice] = 'Project successfully added!'
      redirect_to projects_path
    else
      flash[:alert] = 'Something wrong with your inputs!'
      render :new
    end
  end

  def edit; end

  def update
    @project.update(project_params)

    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy

    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :creator_id, :developer_id, :tester_id)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
