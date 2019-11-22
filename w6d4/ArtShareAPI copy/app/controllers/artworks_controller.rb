class ArtworksController < ApplicationController
  before_action :set_artwork, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token 
  def index
    if params.has_key?(:user_id)
      @artworks = Artwork.where(id: params[:user_id])
      hash = ArtworkShare.where(viewer_id: params[:user_id]).first
      @artworks += Artwork.where(id: hash["artwork_id"])
    else
      @artworks = Artwork.all
    end
    render json: @artworks
  end

  def show
    @artwork = Artwork.find_by(id: params[:id])
    render json: @artwork
  end

  def new
    @artwork = Artwork.new
    render json: @artwork
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors
    end
  end

  def update
    if @artwork.update(artwork_params)
      render json: @artwork
    else
      render json: @artwork.errors
    end
  end

  def destroy
    
    @artwork.destroy
  end

  private
    def set_artwork
      @artwork = Artwork.find(params[:id])
    end

    def artwork_params
      params.require(:artwork).permit(:artist_id, :image_url, :title)
    end

end
