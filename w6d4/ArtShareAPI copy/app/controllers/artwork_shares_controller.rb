class ArtworkSharesController < ApplicationController
  before_action :set_artwork_share, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token 

  # GET /artwork_shares
  # GET /artwork_shares.json
  # def index
  #   @artwork_shares = ArtworkShare.all
  # end

  def show
    @artwork_share = ArtworkShare.find_by(id: params[:id])
    render json: @artwork_share
  end

  def new
    @artwork_share = ArtworkShare.new
    render json: @artwork_share
  end

  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      render json: @artwork_share
    else
      render json: @artwork_share.errors
    end
  end

  def update
    if @artwork_share.update(artwork_share_params)
      render json: @artwork_share
    else
      render json: @artwork_share.errors
    end
  end

  def destroy
    @artwork_share.destroy
  end

  private
    def set_artwork_share
      @artwork_share = ArtworkShare.find(params[:id])
    end

    def artwork_share_params
      params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end
