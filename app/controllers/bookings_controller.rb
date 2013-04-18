class BookingsController < ApplicationController

  def new
    @tour = Tour.find(params[:tour_id])
    @booking = @tour.bookings.build
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @booking = @tour.bookings.build(booking_params)
    if @booking.num_seats <= @tour.available_seats && @booking.save
      @tour.update_attribute(:available_seats, @tour.available_seats)
      redirect_to tours_path
    else
      render 'new'
    end
  end

  private

    def booking_params
        params.require(:booking).permit(:num_seats)
    end

end
