class Api::V1::ColorsController < ApplicationController
  before_action :find_colors, except: [:create]

  def index
    @colors = Color.all
    render json: { color: ColorSerializer.new(@colors)}
  end

  def create
    @color = Color.create(color_params)
    if @color.valid?
      render json: { color: ColorSerializer.new(@color) }, status: :accepted
    else
      render json: { errors: @color.errors.full_messages } , status: :not_acceptable
    end
  end

  def update
    @color.update(color_params)
    if @color.valid?
      render json: { color: ColorSerializer.new(@color) }, status: :accepted
    else
      render json: { errors: @color.errors.full_messages } , status: :not_acceptable
    end
  end

  def destroy
    @color.destroy
  end

  private

  def find_colors
    @color = Color.find(params[:id])
  end

  def color_params
    params.require(:color).permit(:color_hex, :project_id)
  end
end
