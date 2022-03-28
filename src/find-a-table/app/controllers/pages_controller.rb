class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logged_in]
  def home

  end

  def logged_in

  end


end
