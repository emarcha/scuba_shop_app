class Tour < ActiveRecord::Base

  has_many :bookings,
           before_add: :check_available_seats,
           #after_add: :update_available_seats,
           dependent: :destroy

  before_create :populate_available_seats
  before_create :parse_time_input

  validates :title,
            presence: true,
            length: { maximum: 100 }

  validates :tour_date,
            presence: true

  validates :total_seats,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 }

  validates :price_cents,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 0}

  validates :duration_before_typecast,
            presence: true

  private

    def populate_available_seats
      self.available_seats = self.total_seats
    end

    def parse_time_input
      self.duration = ChronicDuration.parse(self.duration_before_typecast)
    end

    def check_available_seats(booking)
      if self.available_seats <= 0
        raise 'No seats available'
      end
    end

    #def update_available_seats(booking)
    #  self.available_seats -= booking.num_seats
    #  self.update_attribute(:available_seats, self.available_seats)
    #end

end
