class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end
end
