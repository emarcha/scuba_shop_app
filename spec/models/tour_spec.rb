require 'spec_helper'

describe Tour do

  before do
    @time_to_parse = '1 hour 30 minutes'
    @tour = Tour.new(title: 'Test Tour',
                     tour_date: '1/1/2013',
                     total_seats: 10,
                     price_cents: 100,
                     duration_before_typecast: @time_to_parse)
  end

  subject { @tour }

  it { should respond_to(:title) }
  it { should respond_to(:tour_date) }
  it { should respond_to(:total_seats) }
  it { should respond_to(:available_seats) }
  it { should respond_to(:price_cents) }
  it { should respond_to(:duration_before_typecast) }
  it { should respond_to(:duration) }
  it { should respond_to(:bookings) }

  it { should be_valid }

  describe 'when title is not present' do
    before { @tour.title = ' '}
    it { should_not be_valid }
  end

  describe 'when title is too long' do
    before { @tour.title = 'a' * 101}
    it { should_not be_valid }
  end

  describe 'when date is not present' do
    before { @tour.tour_date = ' ' }
    it { should_not be_valid }
  end

  describe 'when total seats are not present' do
    before { @tour.total_seats = nil }
    it { should_not be_valid }
  end

  describe 'when total seats are less than 1' do
    before { @tour.total_seats = 0 }
    it { should_not be_valid }
  end

  describe 'when total seats are not an int' do
    before { @tour.total_seats = 'a' }
    it { should_not be_valid }
  end

  describe 'available seats should equal total seats upon save' do
    before { @tour.save }
    its(:available_seats) { should eql(@tour.total_seats) }
  end

  describe 'when pricing is not present' do
    before { @tour.price_cents = ' ' }
    it { should_not be_valid }
  end

  describe 'when pricing is not an int' do
    before { @tour.price_cents = 'a' }
    it { should_not be_valid }
  end

  describe 'when pricing is less than 0' do
    before { @tour.price_cents = -1 }
    it { should_not be_valid }
  end

  describe 'when duration input is not present' do
    before { @tour.duration_before_typecast = ' '}
    it { should_not be_valid }
  end

  describe 'parsing duration input' do
    before { @tour.save }
    its(:duration) { should eql(ChronicDuration.parse(@time_to_parse)) }
  end

  describe 'booking associations' do
    before { @tour.save }
    let!(:older_booking) do
      FactoryGirl.create(:booking, tour: @tour, created_at: 1.day.ago)
    end
    let!(:newer_booking) do
      FactoryGirl.create(:booking, tour: @tour, created_at: 1.hour.ago)
    end

    it 'should have bookings in the right order' do
      expect(@tour.bookings.to_a).to eql([newer_booking, older_booking])
    end

    it 'should destroy associated bookings' do
      bookings = @tour.bookings.to_a
      @tour.destroy
      expect(bookings).not_to be_empty
      bookings.each do |booking|
        expect(Booking.where(id: booking.id)).to be_empty
      end
    end
  end

  describe 'add bookings' do
    let(:num_seats) {2}
    before do
      @tour.save
      @tour.bookings.create(num_seats: num_seats, paid: true)
    end
    it 'should update available seats' do
      expect(Tour.find(@tour.id).available_seats).to eql(@tour.total_seats - num_seats)
    end
  end

end
