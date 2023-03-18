class PostsController < ApplicationController

  def show
    post = Post.find(params[:id])
    
    render json: post, status:ok
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    if post.valid?
      render json: post, status:ok
    else
      render_not_found_response
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def render_not_found_response
    render json: {errors: post.errors.full_messages}, status: :unprocessable_entity
  end

end
