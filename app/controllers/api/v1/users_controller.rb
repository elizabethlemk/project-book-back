class Api::V1::UsersController < ApplicationController
  before_action :find_user, except: [:create, :profile]
  skip_before_action :authorized, only: [:create]

  def profile
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.create(user_params)
    if !@user.image.blank?
      @user.image.attach(user_params[:image])
    end
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: UserSerializer.new(@user), jwt: token }, status: :created
    else
      render json: { errors: @user.errors.full_messages } , status: :not_acceptable
    end
  end

  def update
    unless @user.update(user_params)
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
  end

  private

  def find_user
   @user = User.find(params[:id])
   rescue ActiveRecord::RecordNotFound
     render json: { errors: 'User not found' }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :email, :birthday, :image)
  end
end
