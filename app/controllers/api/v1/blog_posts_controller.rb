class Api::V1::BlogPostsController < ApplicationController
  skip_before_action :authorized, only: [:index]
  before_action :find_blog, only: [:show, :update, :destroy]

  def index
    @blog_posts = BlogPost.all
    render json: @blog_posts
  end

  def show
    render json: {blog_post: BlogPostSerializer.new(@blog_post) }
  end

  def create
    @blog_post = BlogPost.create(blog_post_params)
    render json: {blog_post: BlogPostSerializer.new(@blog_post) }
  end

  def update
    @blog_post.update
    render json: {blog_post: BlogPostSerializer.new(@blog_post) }
  end

  def destroy
    @blog_post.destroy
  end

  private

  def find_blog
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:user_id, :title, :content)
  end
end
