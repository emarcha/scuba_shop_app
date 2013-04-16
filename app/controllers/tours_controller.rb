class ToursController < ApplicationController

  before_action :admin_user,      only: [:new, :create, :show]

  def index
    @tours = Tour.paginate(page: params[:page])
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:success] = "New tour created!"
      redirect_to @tour
    else
      render 'new'
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @bookings = @tour.bookings.paginate(page: params[:page])
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
