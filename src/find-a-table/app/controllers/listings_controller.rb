class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  def index
    @listing = Listing.all
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new
    @listing.user_id = current_user.id
    @listing.tag_list = []
  end

  def tagged
    if params[:tag].present?
      @listing = Listing.tagged_with(params[:tag])
    else
      @listing = Listing.all
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      p @listing
      @listing.save
      redirect_to @listing
    else
      p @listing
      render :new
    end
  end

  def edit
  end
  private
  def listing_params
    params.require(:listing).permit(:title, :description, :user_id, :tag_list)
  end
end