class Api::V1::ProjectsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_project, except: [:create, :index, :destroy_image]

  def index
    @projects = Project.all
    render json: @projects
  end

  def show
    render json: { project: ProjectSerializer.new(@project) }
  end

  def create
    @project = Project.create(project_params)
    if @project.valid?
      render json: { project: ProjectSerializer.new(@project) }, status: :accepted
    else
      render json: { errors: @project.errors.full_messages } , status: :not_acceptable
    end
  end

  def update
    @project.update(project_params)
    if @project.valid?
      render json: { project: ProjectSerializer.new(@project) }, status: :accepted
    else
      render json: { errors: @project.errors.full_messages } , status: :not_acceptable
    end
  end

  def destroy
    @project.destroy
  end

  def destroy_image
    @project = Project.find(params[:project_id])
    @project.images.find(params[:image_id]).purge
  end

  private
  def find_project
    @project = Project.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:user_id, :title, :color, :completed, :mood_board, :images)
  end
end
