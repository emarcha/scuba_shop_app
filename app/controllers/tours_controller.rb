class ToursController < ApplicationController

  before_action :admin_user

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def new
    @tour = Tour.new
  end

  def show
    @tour = Tour.find(params[:id])
  end

end
