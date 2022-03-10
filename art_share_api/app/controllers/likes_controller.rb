class LikesController < ApplicationController
  def index

    if params[:like_type] == 'Comment'
      render json: User.find(params[:user_id]).liked_comments
    elsif params[:like_type] == 'Artwork'
      render json: User.find(params[:user_id]).liked_artworks
    end
  end

end