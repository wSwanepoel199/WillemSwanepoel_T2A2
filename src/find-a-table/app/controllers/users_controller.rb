class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all.preload(:listings).includes(:tags => :taggings).map
  end

  def show
    @user = User.find(params[:id])
  end
end
