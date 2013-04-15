require 'spec_helper'

describe Tour do

  before do
    @tour = Tour.new(title: 'Test Tour',
                     tour_date: '1/1/2013',
                     total_seats: 10,
                     price_cents: 100 )
  end

  subject { @tour }

  it { should respond_to(:title) }
  it { should respond_to(:tour_date) }
  it { should respond_to(:total_seats) }
  it { should respond_to(:available_seats) }
  it { should respond_to(:price_cents) }

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

end
