class Tour < ActiveRecord::Base

  has_many :bookings

  before_save :populate_available_seats

  validates :title,
            presence: true,
            length: { maximum: 100 }

  validates :tour_date,
            presence: true

  validates :total_seats,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 }

  private

    def populate_available_seats
      self.available_seats = self.total_seats
    end

end
