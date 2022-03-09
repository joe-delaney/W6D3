class ArtworkSharesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @artworks = @user.artworks
    @shared_artworks = @user.shared_artworks
    render json: @artworks + @shared_artworks
  end

  def create
    @artwork_share = ArtworkShare.new(artwork_shares_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors.full_messages, status: :unprocessable_entity
    end    
  end

  def destroy 
    @artwork_share = ArtworkShare.find(params[:id])
    @artwork_share.destroy
    render json: @artwork_share
  end

  private

  def artwork_shares_params
    params.require(:artwork_shares).permit(:artwork_id, :viewer_id)
  end
end