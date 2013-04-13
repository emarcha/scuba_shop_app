class ToursController < ApplicationController

  before_action :admin_user

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def new
    @tour = Tour.new
  end

end
