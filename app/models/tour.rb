class Tour < ActiveRecord::Base

  has_many :bookings

  validates :title,
    presence: true,
    length: { maximum: 100 }

end
