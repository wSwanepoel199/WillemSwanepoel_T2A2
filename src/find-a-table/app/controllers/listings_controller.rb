class ListingsController < ApplicationController
  
  def index
    params[:tag] ? @posts = Listing.tagged_with(params[:tag]) : @posts = Listing.all
  end
 
  def show
    @post = Listing.find(params[:id])
  end
  def new
    @post = Listing.new
  end
  def create
    @post = Listing.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end
  private
def post_params
    params.require(:listing).permit(:title, :content, :tag_list, :tag, { tag_ids: [] }, :tag_ids)
  end
end
