class BookingsController < ApplicationController

  def new
    @booking = @tour.bookings.build
  end

end
