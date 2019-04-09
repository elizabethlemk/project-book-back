class Api::V1::LinksController < ApplicationController
  before_action :find_links, except: [:create]

  def index
    @links = Link.all
    render json: { link: LinkSerializer.new(@links) }
  end

  def create
    @link = Link.create(links_params)
    if @link.valid?
      render json: { link: LinkSerializer.new(@link) }, status: :accepted
    else
      render json: { errors: @link.errors.full_messages } , status: :not_acceptable
    end
  end

  def destroy
    @link.destroy
  end

  private

  def find_links
    @link = Link.find(params[:id])
  end

  def links_params
    params.require(:links).permit(:project_id, :url)
  end
end
