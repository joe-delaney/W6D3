class ArtworksController < ApplicationController
  def index
    @artworks = User.find(params[:user_id]).all_artworks
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

  def collections 
    render json: Artwork.find(params[:id]).collections
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end