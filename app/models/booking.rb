class Booking < ActiveRecord::Base

  belongs_to :tour

  validates :tour_id,
    presence: true

end
