class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:logged_in]
  def home
    p "alt+p to show mini-profiler"

  end

  def logged_in

  end


end
