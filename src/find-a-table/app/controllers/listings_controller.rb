class ListingsController < ApplicationController
  
  def index
    params[:tag] ? @listing = Listing.tagged_with(params[:tag]) : @listing = Listing.all
  end
 
  def show
    @listing = Listing.find(params[:id])
  end
  def new
    @listing = Listing.new
  end
  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to @listing
    else
      render :new
    end
  end
  def edit
    @listing = Listing.find(params[:id])
  end
  private
def listing_params
    params.require(:listing).permit(:title, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
