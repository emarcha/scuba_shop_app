require 'spec_helper'

describe Booking do

  before do
    @booking = Booking.new(tour_id: 10,
                           num_seats: 2)
  end

  subject { @booking }

  it { should respond_to(:tour_id) }
  it { should respond_to(:num_seats) }

  it { should be_valid }

  describe 'when tour_id is not present' do
    before { @booking.tour_id = ' '}
    it { should_not  be_valid }
  end

  describe 'when seats are not present' do
    before { @booking.num_seats = nil }
    it { should_not be_valid }
  end

  describe 'when seats are less than 1' do
    before { @booking.num_seats = 0 }
    it { should_not be_valid }
  end

end
