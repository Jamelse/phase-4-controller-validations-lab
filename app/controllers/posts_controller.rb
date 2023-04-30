class PostsController < ApplicationController

  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_errors_handle

  def show
    post = Post.find(params[:id])
    
    render json: post
  end

  def update
    post = Post.find(params[:id])

    post.update!(post_params)

    render json: post
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def unprocessable_entity_errors_handle(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end

end
