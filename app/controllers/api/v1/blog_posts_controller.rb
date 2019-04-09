class Api::V1::BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
    render json: {blog_post: BlogPostSerializer.new(@blog_posts) }
  end

  def create
    @blog_post = BlogPost.create(blog_post_params)
    render json: {blog_post: BlogPostSerializer.new(@blog_post) }
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update
    render json: {blog_post: BlogPostSerializer.new(@blog_post) }
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:user_id, :title, :content)
  end
end
