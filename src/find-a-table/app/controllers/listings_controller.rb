class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  
  def index
    @listing = Listing.all
    @user = User.all
  end

  def show
    @listing = Listing.find(params[:id])
    @user = User.all
  end

  def new
    @listing = Listing.new
    @listing.user_id = current_user.id
    @listing.tag_list = []

    respond_to do |format|
      format.html  # index.html.erb
      format.json  { render :json => ActsAsTaggableOn::Tag.most_used(10) }
    end
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
    @user = User.all
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
    @listing = Listing.new(listing_params)
    if @listing.save
      @listing.save
      redirect_to @listing
    else
      render :new
    end
  end

  def edit
  end
  
  private
  def listing_params
    params.require(:listing).permit(:title, :description, :user_id, :search, :css, tag_list: [])
  end
end
