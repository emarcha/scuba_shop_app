class BookingsController < ApplicationController

  def new
    @tour = Tour.find(params[:tour_id])
    @booking = @tour.bookings.build
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @booking = @tour.bookings.build(booking_params)
    if @booking.save
      unless signed_in? && current_user.admin?
        redirect_to tours_path
      else
        redirect_to @tour
      end
    else
      render 'new'
    end
  end

  private

    def booking_params
        params.require(:booking).permit(:num_seats,
                                        :credit_card_number,
                                        :card_security_code,
                                        :card_name,
                                        :card_exp_month,
                                        :card_exp_year,
                                        :confirmation_email,
                                        :billing_address,
                                        :billing_state,
                                        :billing_zipcode)
    end

end
