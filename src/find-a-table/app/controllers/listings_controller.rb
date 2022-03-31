class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :tagged, :search]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  
  def index
    @listing = Listing.all
  end

  def show
  end

  def new
    @listing = Listing.new
  end

  def tagged
    @user = User.all
    if params[:tag].present?
      @listing = Listing.tagged_with(params[:tag])
    else
      @listing = Listing.all
    end
  end

  def search
    if params[:search].present?
      css = params[:css]
      case css
      when "tag_list"
        @listing = Listing.tagged_with(params[:search], :wild => true, :any => true)
      when "title"
        @listing = Listing.global_search(css, params[:search])
      end
    else
      @listing = Listing.all
    end
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if params[:title].blank?
      render "new"
    else
      if @listing.save
        @listing.save
        redirect_to @listing
      else
        pp @listing.errors
        render "new"
      end
    end
  end

  def update
    @listing.update(listing_params)
    if params[:title].blank?
      render "edit"
    else
      if @listing.save
        @listing.save
        redirect_to @listing
      else
        pp @listing.errors
        render "edit"
      end
    end
  end

  def edit
  end

  def destroy
    @listing.destroy
  end
  
  private
  def listing_params
    params.require(:listing).permit(:title, :description, :search, :css, tag_list: [])
  end
  def set_listing
    @listing = Listing.find(params[:id])
  end
end
