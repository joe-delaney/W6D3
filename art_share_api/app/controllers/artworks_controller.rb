class ArtworksController < ApplicationController
  def index
    @user = User.find(params[:artist_id])
    @artworks = @user.artworks + @user.shared_artworks
    render json: @artworks
  end

  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update(artwork_params)
      redirect_to update_artwork_url(@artwork)
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def create
    @artwork = Artwork.new(artwork_params)
    # @artwork.artist = User.first
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
      
  end

  def show
    @artwork = Artwork.find(params[:id])
    render json: @artwork
  end

  def destroy
    @artwork = Artwork.find(params[:id])
    @artwork.destroy
    render json: @artwork
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end