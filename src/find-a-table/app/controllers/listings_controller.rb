class ListingsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :tagged, :search]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authorise_user, only: [:edit, :update, :destroy]
  
  def index
    if params[:search].present?
      search(:css, :search)
    elsif
      if params[:tag].present?
        tagged(:tag)
      end
    else
      @listing = Listing.all
    end
  end

  def show
    @listing = @listing
  end

  def new
    @listing = Listing.new
  end

  def tagged(tag)
    if params[:tag].present?
      @listing = Listing.tagged_with(params[:tag])
    else
      @listing = Listing.all
    end
  end

  def search(css,search)
    if params[:search].present?
      css = params[:css]
      case css
      when "tag_list"
        @listing = Listing.tagged_with(params[:search], :wild => true, :any => true)
      when "title"
        @params = params[:search].downcase
        @listing = Listing.all.where("lower(title) LIKE :search", search: "%#{@params}%")
      else
        @listing = Listing.all
        flash[:alert] = "Could not find search"
      end
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if params[:title].blank?
      @listing = current_user.listings.new(listing_params)
      if @listing.save
        @listing.save
        redirect_to @listing
      else
        pp @listing.errors
        render "new"
      end
    else
      render "new"
    end
  end

  def update
    @listing.update(listing_params)
    if params[:title].blank?
      if @listing.save
        @listing.save
        redirect_to @listing
      else
        pp @listing.errors
        render "edit"
      end
    else
      render "edit"
    end
  end

  def edit
  end

  def destroy
    @listing.destroy
    redirect_to @listing, flash[:notice] = "Listing successfully deleted"
  end
  
  private
  def listing_params
    params.require(:listing).permit(:title, :description, :picture, :search, :css, tag_list: [])
  end

  def authorise_user
    if @listing.user_id != current_user.id
      flash[:alert] = "Not your listing to edit or delete"
      redirect_to listings_path
    end
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
