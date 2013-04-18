require 'spec_helper'

describe Booking do

  let(:tour) { FactoryGirl.create(:tour) }

  before do
    @booking = tour.bookings.build(num_seats: 2,
                                   paid: true,
                                   credit_card_number: '4539762311332008')
  end

  subject { @booking }

  it { should respond_to(:num_seats) }
  it { should respond_to(:paid) }
  it { should respond_to(:tour_id) }
  it { should respond_to(:tour) }
  it { should respond_to(:credit_card_number) }

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

  describe 'when credit card number is not present' do
    before { @booking.credit_card_number = ' ' }
    it { should_not be_valid }
  end

  describe 'when credit card number is too long' do
    before { @booking.credit_card_number = 'a' * 20 }
    it { should_not be_valid }
  end

end
