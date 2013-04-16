class Booking < ActiveRecord::Base

  belongs_to :tour

  default_scope -> { order('created_at DESC') }

  validates :tour_id,
            presence: true

  validates :num_seats,
            presence: true,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: 1 }

  validates :paid,
            presence: true

end
