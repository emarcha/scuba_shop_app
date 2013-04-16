require 'spec_helper'

describe Booking do

  let(:tour) { FactoryGirl.create(:tour) }

  before do
    @booking = tour.bookings.build(num_seats: 2,
                                   paid: true)
  end

  subject { @booking }

  it { should respond_to(:num_seats) }
  it { should respond_to(:paid) }
  it { should respond_to(:tour_id) }
  it { should respond_to(:tour) }

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

  describe 'when paid status is not set' do
    before { @booking.paid = nil }
    it { should_not be_valid }
  end

end
