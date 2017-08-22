class LikesController < ApplicationController

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      render json: @user.likes
    elsif params[:artwork_id]
      @artwork = Artwork.find(params[:artwork_id])
      render json: @artwork.likes
    elsif params[:comment_id]
      @comment = Comment.find(params[:comment_id])
      render json: @comment.likes
    else
      render plain: "not found", status: 404
    end
  end

  def create
    debugger
    @like = Like.new(like_params)
    if @like.save
      render json: @like
    else
      render plain: @like.errors.full_messages
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      render json: @like
    else
      render plain: @like.errors.full_messages
    end
  end

  private

  def like_params
    params.require(:like).permit(:liker_id, :comment_id, :artwork_id)
  end
end
