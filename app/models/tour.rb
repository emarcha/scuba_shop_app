class Tour < ActiveRecord::Base

  has_many :bookings, dependent: :destroy

  before_save :populate_available_seats
  before_save :parse_time_input

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

end
