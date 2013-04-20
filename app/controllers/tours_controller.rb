class ToursController < ApplicationController

  before_action :admin_user,      only: [:new, :create, :show, :edit, :update, :destroy]

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:success] = 'New tour created!'
      redirect_to @tour
    else
      render 'new'
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @bookings = @tour.bookings.paginate(page: params[:page])
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    if @tour.update_attributes(user_params)
      flash[:success] = 'Tour updated!'
      redirect_to @tour
    else
      render 'edit'
    end
  end

  def destroy
    Tour.find(params[:id]).destroy
    flash[:success] = 'Tour canceled and bookings notified.'
    redirect_to tours_path
  end

  private

    def tour_params
      params.require(:tour).permit(:title,
                                   :tour_date,
                                   :total_seats,
                                   :duration_before_typecast,
                                   :price_cents)
    end

end
