class Api::V1::ProjectsController < ApplicationController
  before_action :find_project, except: [:create]

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
    @project.images.attach(params[:project][:images])
    @project.update
    if @project.valid?
      render json: { project: ProjectSerializer.new(@project) }, status: :accepted
    else
      render json: { errors: @project.errors.full_messages } , status: :not_acceptable
    end
  end

  def destroy
    @project.destroy
  end

  private
  def find_project
    @project = Project.find(params[:id])
  end


  def project_params
    params.require(:project).permit(:user_id, :title, :color, :images, :completed, :mood_board)
  end
end
