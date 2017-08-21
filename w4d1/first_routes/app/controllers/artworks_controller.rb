class ArtworksController < ApplicationController
  def index
    @user = User.find(params[:user_id])

    @artworks = @user.artworks + @user.viewed_artworks

    render json: @artworks
  end

  def show
    @artwork = Artwork.find(params[:id])

    if @artwork
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: 404
    end

  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      redirect_to artworks_url
    else
      render json: @artwork.errors.full_messages, status: 422
    end

  end

  def destroy
    @artwork = Artwork.find(params[:id])

    if @artwork.destroy
      redirect_to artworks_url
    else
      render json: @artwork.errors.full_messages
    end
  end

  def update
    @artwork = Artwork.find(params[:id])

    if @artwork.update(artwork_params)
      redirect_to artwork_url
    else
      render plain: @artwork.errors.full_messages
    end
  end

  private

  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end
end
