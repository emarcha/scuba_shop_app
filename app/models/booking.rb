class Booking < ActiveRecord::Base

  belongs_to :tour

  default_scope -> { order('created_at DESC') }

  before_save :check_available_seats
  after_save :update_available_seats

  validates :tour_id,
            presence: true

  validates :num_seats,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 }

  private

    def check_available_seats
      if self.tour.available_seats < self.num_seats
        raise 'Number of seats booked cannot be greater than available seats'
      end
    end

    def update_available_seats
      #self.tour.available_seats -= self.num_seats
      self.tour.update(available_seats: (self.tour.available_seats-=self.num_seats))
    end

end
