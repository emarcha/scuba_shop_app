class Booking < ActiveRecord::Base

  belongs_to :tour

  default_scope -> { order('created_at DESC') }

  before_save :check_available_seats
  #before_save :check_credit_card_number
  after_save :update_available_seats

  validates :tour_id,
            presence: true

  validates :num_seats,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 }

  validates :credit_card_number,
            presence: true,
            length: { maximum: 19 }

  validate :real_credit_card_number

  validates :card_security_code,
            presence: true,
            numericality: { only_integer: true,
                            greater_than: 99,
                            less_than: 10000 }

  private

    def check_available_seats
      if self.tour.available_seats < self.num_seats
        raise 'Number of booked seats cannot be greater than available seats'
      end
    end

    def update_available_seats
      self.tour.update(available_seats: (self.tour.available_seats-=self.num_seats))
    end

    def real_credit_card_number
      unless credit_card_number.creditcard?
        errors.add(:credit_card_number, 'needs to be a real credit card number')
      end
    end

end
