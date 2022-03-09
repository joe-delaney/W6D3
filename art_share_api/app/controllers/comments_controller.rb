class CommentsController < ApplicationController
  def index 
    if params[:artwork_id]
      @comments = Artwork.find(params[:artwork_id]).comments
    else # we know we are dealing with user_id
      @comments = User.find(params[:user_id]).comments
    end
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end    
  end

  def destroy 
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment
  end


  private 

  def comment_params
    params.require(:comments).permit(:artwork_id, :user_id, :body)
  end
end